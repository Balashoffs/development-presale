#!/usr/bin/env bash
# Build the Flutter web image locally, ship it to a VPS over SSH (pubkey auth),
# upload the consumer assets, and run the container with assets mounted as a
# volume. Configure via env vars or a gitignored .env.deploy file next to this
# script.
#
# Required:
#   VPS_HOST          e.g. user@203.0.113.10  (or a Host alias from ~/.ssh/config)
#   VPS_PORT          host port to publish on the VPS, e.g. 8080
#   CONSUMER_FOLDER   .consumer_env/<folder> to bake into this build,
#                     e.g. consumer_2  (overridden by --consumer=<folder>)
#
# Optional:
#   SSH_KEY           path to the private key, e.g. ~/.ssh/id_ed25519
#   SSH_PORT          default 22
#   SSH_OPTS          extra raw flags, e.g. "-o StrictHostKeyChecking=accept-new"
#   IMAGE_NAME        default presale
#   IMAGE_TAG         default <git short SHA>, fallback "latest"
#   CONTAINER_NAME    default presale
#   RESTART_POLICY    default unless-stopped
#   REMOTE_DIR        directory on the VPS for assets and uploads,
#                     default "presale" (relative to remote $HOME)
#
# Usage:
#   ./deploy.sh                              # build + ship + run (reads .env.deploy)
#   ./deploy.sh --consumer=consumer_2        # override CONSUMER_FOLDER
#   ./deploy.sh --consumer=consumer_2 --logs # tail container logs after deploy
#   ./deploy.sh --no-build                   # skip local build, ship existing image

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

do_build=1
do_logs=0
CLI_CONSUMER=""
for arg in "$@"; do
  case "$arg" in
    --consumer=*) CLI_CONSUMER="${arg#*=}" ;;
    --no-build)   do_build=0 ;;
    --logs)       do_logs=1 ;;
    -h|--help)    sed -n '2,30p' "$0"; exit 0 ;;
    *) echo "unknown arg: $arg" >&2; exit 2 ;;
  esac
done

ENV_FILE=".env.deploy"

# Safe KEY=VALUE parser — no command execution, no quoting traps.
# Accepts:  KEY=value   KEY="value"   KEY='value'   # comments   blank lines
if [[ -f "$ENV_FILE" ]]; then
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%$'\r'}"
    [[ -z "${line// }" ]] && continue
    [[ "${line#"${line%%[![:space:]]*}"}" == \#* ]] && continue
    if [[ "$line" =~ ^[[:space:]]*([A-Za-z_][A-Za-z0-9_]*)=(.*)$ ]]; then
      key="${BASH_REMATCH[1]}"
      val="${BASH_REMATCH[2]}"
      if [[ "$val" =~ ^\"(.*)\"[[:space:]]*(#.*)?$ || "$val" =~ ^\'(.*)\'[[:space:]]*(#.*)?$ ]]; then
        val="${BASH_REMATCH[1]}"
      else
        val="${val%%[[:space:]]#*}"
        val="${val%"${val##*[![:space:]]}"}"
      fi
      # Local tilde expansion (used for SSH_KEY); REMOTE_DIR should not start with ~.
      val="${val/#\~/$HOME}"
      export "$key=$val"
    fi
  done < "$ENV_FILE"
fi

# CLI override wins over env file.
[[ -n "$CLI_CONSUMER" ]] && CONSUMER_FOLDER="$CLI_CONSUMER"

: "${VPS_HOST:?VPS_HOST is required (e.g. user@host)}"
: "${VPS_PORT:?VPS_PORT is required (host port to publish on the VPS)}"
: "${CONSUMER_FOLDER:?CONSUMER_FOLDER is required (set in .env.deploy or pass --consumer=<folder>)}"

SSH_PORT="${SSH_PORT:-22}"
SSH_KEY="${SSH_KEY:-}"
SSH_OPTS="${SSH_OPTS:-}"
IMAGE_NAME="${IMAGE_NAME:-presale}"
IMAGE_TAG="${IMAGE_TAG:-$(git rev-parse --short HEAD 2>/dev/null || echo latest)}"
IMAGE_REF="${IMAGE_NAME}:${IMAGE_TAG}"
CONTAINER_NAME="${CONTAINER_NAME:-presale}"
RESTART_POLICY="${RESTART_POLICY:-unless-stopped}"
REMOTE_DIR="${REMOTE_DIR:-presale}"

# Consumer-specific files baked into the image (via --build-arg) or shipped as a volume.
# Launcher icons (.consumer_env/flutter_launcher_icons.yaml) are only used by native
# platforms (android/ios/macos/windows), not by `flutter build web`, so they are not
# referenced here.
CONSUMER_ENV_DIR=".consumer_env/${CONSUMER_FOLDER}"
DART_DEFINE_FILE="${CONSUMER_ENV_DIR}/dart_define_file.json"
CONSUMER_ASSETS_DIR="${CONSUMER_ENV_DIR}/assets"

[[ -f "$DART_DEFINE_FILE"    ]] || { echo "missing $DART_DEFINE_FILE" >&2; exit 2; }
[[ -d "$CONSUMER_ASSETS_DIR" ]] || { echo "missing $CONSUMER_ASSETS_DIR" >&2; exit 2; }

# Build SSH args once so paths with spaces are preserved.
SSH_ARGS=(-p "${SSH_PORT}")
SCP_ARGS=(-P "${SSH_PORT}")
if [[ -n "$SSH_KEY" ]]; then
  [[ -r "$SSH_KEY" ]] || { echo "SSH_KEY not readable: $SSH_KEY" >&2; exit 2; }
  SSH_ARGS+=(-i "$SSH_KEY" -o IdentitiesOnly=yes)
  SCP_ARGS+=(-i "$SSH_KEY" -o IdentitiesOnly=yes)
fi
# shellcheck disable=SC2206
SSH_ARGS+=(${SSH_OPTS})
# shellcheck disable=SC2206
SCP_ARGS+=(${SSH_OPTS})

say() { printf '\033[1;34m▶ %s\033[0m\n' "$*"; }

say "Verifying SSH connection to ${VPS_HOST}"
ssh -o BatchMode=yes -o ConnectTimeout=10 "${SSH_ARGS[@]}" "${VPS_HOST}" \
  'docker version --format "{{.Server.Version}}"' >/dev/null

if (( do_build )); then
  say "Encoding consumer config from ${CONSUMER_ENV_DIR}"
  DART_DEFINE_B64="$(openssl base64 -A -in "$DART_DEFINE_FILE")"

  # pubspec.yaml lists `assets/data/...` paths; sync them from the chosen
  # consumer so `flutter build web` can resolve them inside the image.
  say "Syncing consumer assets → ./assets"
  rm -rf assets
  mkdir -p assets
  cp -R "${CONSUMER_ASSETS_DIR}/." assets/

  say "Building ${IMAGE_REF} for linux/amd64 (consumer=${CONSUMER_FOLDER})"
  docker buildx build --platform linux/amd64 --load \
    --build-arg DART_DEFINE_FILE_CONTENT="$DART_DEFINE_B64" \
    -t "${IMAGE_REF}" .
fi

say "Shipping image to ${VPS_HOST} (streaming, may take a minute)"
docker save "${IMAGE_REF}" | gzip \
  | ssh "${SSH_ARGS[@]}" "${VPS_HOST}" "gunzip | docker load"

ASSETS_TMP_DIR="$(mktemp -d -t presale-assets.XXXXXX)"
ASSETS_ZIP="${ASSETS_TMP_DIR}/assets.zip"
trap 'rm -rf "$ASSETS_TMP_DIR"' EXIT

say "Packing consumer assets → $(basename "$ASSETS_ZIP")"
( cd "$CONSUMER_ASSETS_DIR" && zip -qr "$ASSETS_ZIP" . )

say "Uploading assets to ${VPS_HOST}:${REMOTE_DIR}/assets.zip"
ssh "${SSH_ARGS[@]}" "${VPS_HOST}" "mkdir -p '${REMOTE_DIR}'"
scp "${SCP_ARGS[@]}" "$ASSETS_ZIP" "${VPS_HOST}:${REMOTE_DIR}/assets.zip"

say "Deploying container ${CONTAINER_NAME} on :${VPS_PORT} → 80"
ssh "${SSH_ARGS[@]}" "${VPS_HOST}" bash -s <<REMOTE
set -euo pipefail

# Free the volume mount before touching the assets dir.
docker rm -f '${CONTAINER_NAME}' >/dev/null 2>&1 || true

REMOTE_DIR_ABS="\$(cd '${REMOTE_DIR}' && pwd)"
ASSETS_DIR="\${REMOTE_DIR_ABS}/assets"

# Wipe any stale assets dir (may contain files from prior deploy that this user
# can't overwrite directly). Parent dir must be writable; rm -rf can still
# remove children regardless of their owner.
rm -rf "\$ASSETS_DIR"
mkdir -p "\$ASSETS_DIR"
unzip -oq "\${REMOTE_DIR_ABS}/assets.zip" -d "\$ASSETS_DIR"
rm -f "\${REMOTE_DIR_ABS}/assets.zip"
docker run -d \\
  --name '${CONTAINER_NAME}' \\
  --restart '${RESTART_POLICY}' \\
  -p '${VPS_PORT}:80' \\
  -v "\${ASSETS_DIR}:/usr/share/nginx/html/assets/assets" \\
  '${IMAGE_REF}'

docker ps --filter "name=^/${CONTAINER_NAME}\\\$" \\
  --format 'table {{.Names}}\\t{{.Status}}\\t{{.Ports}}\\t{{.Image}}'
REMOTE

say "Done. Reach it at http://<vps>:${VPS_PORT}"

if (( do_logs )); then
  say "Tailing logs (Ctrl+C to stop)"
  ssh "${SSH_ARGS[@]}" "${VPS_HOST}" \
    "docker logs -f --tail 50 '${CONTAINER_NAME}'"
fi
