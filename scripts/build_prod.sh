#!/usr/bin/env zsh
# Usage: ./scripts/build_prod.sh <consumer_folder> <version>
# Example: ./scripts/build_prod.sh consumer_0 1.0.0
# Run from anywhere — paths are resolved relative to script location.

set -e

# ==========================================
# CONFIGURATION — EDIT THESE
# ==========================================
VPS_KEY_NAME="217.18.62.204"
VPS_USER="root"
VPS_IP="217.18.62.204"
VPS_PORT="22"
APP_NAME="presale_prod"

# ==========================================
# ARGUMENTS
# ==========================================
CONSUMER_FOLDER="$1"
VERSION="$2"

# ==========================================
# VALIDATE ARGUMENTS
# ==========================================
if [[ -z "$CONSUMER_FOLDER" ]]; then
    echo "[ERROR] Missing argument: consumer_folder"
    echo "Usage: $0 <consumer_folder> <version>"
    echo "Example: $0 consumer_0 1.0.0"
    exit 1
fi

if [[ -z "$VERSION" ]]; then
    echo "[ERROR] Missing argument: version"
    echo "Usage: $0 <consumer_folder> <version>"
    echo "Example: $0 consumer_0 1.0.0"
    exit 1
fi

# ==========================================
# DERIVED PATHS
# ==========================================
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ASSETS_DIR="$PROJECT_DIR/assets"
CONSUMER_ENV_DIR="$PROJECT_DIR/.consumer_env/$CONSUMER_FOLDER"
CONSUMER_ASSETS_DIR="$CONSUMER_ENV_DIR/assets"
DART_DEFINE_FILE="$CONSUMER_ENV_DIR/dart_define_file.json"
LAUNCHER_ICONS_FILE="$PROJECT_DIR/.consumer_env/flutter_launcher_icons.yaml"
IMAGE_TAG="${APP_NAME}:${VERSION}"
TAR_NAME="${APP_NAME}_v${VERSION}.tar"
TAR_PATH="$SCRIPT_DIR/$TAR_NAME"
ZIP_NAME="${APP_NAME}_assets_v${VERSION}.zip"
ZIP_PATH="$SCRIPT_DIR/$ZIP_NAME"

# ==========================================
# STEP 1: VALIDATE INPUTS
# ==========================================
echo ""
echo "[STEP 1] Validating inputs..."

[[ -d "$CONSUMER_ASSETS_DIR" ]] || { echo "[ERROR] Consumer assets not found: $CONSUMER_ASSETS_DIR"; exit 1; }
[[ -f "$DART_DEFINE_FILE" ]]    || { echo "[ERROR] dart_define_file.json not found: $DART_DEFINE_FILE"; exit 1; }
[[ -f "$LAUNCHER_ICONS_FILE" ]] || { echo "[ERROR] flutter_launcher_icons.yaml not found: $LAUNCHER_ICONS_FILE"; exit 1; }

echo "[OK] All inputs validated."

# ==========================================
# STEP 2: CLEAN ASSETS
# ==========================================
echo ""
echo "[STEP 2] Cleaning assets directory..."

if [[ -d "$ASSETS_DIR" ]]; then
    rm -rf "$ASSETS_DIR"
    echo "[OK] Assets directory deleted."
else
    echo "[SKIP] Assets directory does not exist."
fi

# ==========================================
# STEP 3: COPY CONSUMER ASSETS
# ==========================================
echo ""
echo "[STEP 3] Copying assets from: $CONSUMER_ASSETS_DIR"

mkdir -p "$ASSETS_DIR"
cp -r "$CONSUMER_ASSETS_DIR/." "$ASSETS_DIR/"
echo "[OK] Assets copied."

# ==========================================
# STEP 4: FLUTTER CLEAN
# ==========================================
echo ""
echo "[STEP 4] Running fvm flutter clean..."

cd "$PROJECT_DIR"
fvm flutter clean
echo "[OK] Flutter clean done."

# ==========================================
# STEP 5: BUILD RUNNER
# ==========================================
echo ""
echo "[STEP 5] Running build_runner..."

fvm dart run build_runner build -d
echo "[OK] build_runner done."

# ==========================================
# STEP 6: DOCKER BUILD
# ==========================================
echo ""
echo "[STEP 6] Building Docker image: $IMAGE_TAG"

# openssl base64 -A: no line wrapping, works on macOS and Linux
DART_DEFINE_B64=$(openssl base64 -A -in "$DART_DEFINE_FILE")
LAUNCHER_ICONS_B64=$(openssl base64 -A -in "$LAUNCHER_ICONS_FILE")

export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -f "$SCRIPT_DIR/dockerfile_prod" \
    --build-arg DART_DEFINE_FILE_CONTENT="$DART_DEFINE_B64" \
    --build-arg LAUNCHER_ICONS_CONTENT="$LAUNCHER_ICONS_B64" \
    -t "$IMAGE_TAG" "$PROJECT_DIR"

echo "[OK] Docker image built."

# ==========================================
# STEP 7: DOCKER SAVE
# ==========================================
echo ""
echo "[STEP 7] Saving Docker image to tar: $TAR_PATH"

docker save -o "$TAR_PATH" "$IMAGE_TAG"
echo "[OK] Docker image saved."

# ==========================================
# STEP 8: ZIP ASSETS
# ==========================================
echo ""
echo "[STEP 8] Zipping assets..."

rm -f "$ZIP_PATH"
cd "$ASSETS_DIR"
zip -r "$ZIP_PATH" .
cd "$PROJECT_DIR"
echo "[OK] Assets zipped: $ZIP_NAME"

# ==========================================
# STEP 9: SCP TAR TO VPS
# ==========================================
echo ""
echo "[STEP 9] Uploading tar to VPS..."

scp -P $VPS_PORT -i "$HOME/.ssh/$VPS_KEY_NAME" "$TAR_PATH" "$VPS_USER@$VPS_IP:/home/beard/presale/$TAR_NAME"
echo "[OK] Tar uploaded."

# ==========================================
# STEP 10: SCP ZIP TO VPS
# ==========================================
echo ""
echo "[STEP 10] Uploading assets zip to VPS..."

scp -P $VPS_PORT -i "$HOME/.ssh/$VPS_KEY_NAME" "$ZIP_PATH" "$VPS_USER@$VPS_IP:/home/beard/presale/$ZIP_NAME"
echo "[OK] Assets zip uploaded."

# ==========================================
# STEP 11: CLEANUP
# ==========================================
echo ""
echo "[STEP 11] Cleaning up local files..."

rm -f "$TAR_PATH" "$ZIP_PATH"
echo "[OK] Local files cleaned up."

echo ""
echo "[DONE] Build and upload complete."
echo "       Image: $IMAGE_TAG"
echo "       On VPS run: ./deploy_vps.sh $TAR_NAME $ZIP_NAME <port>"
echo ""
