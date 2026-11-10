#!/usr/bin/env bash
# Usage: ./deploy_vps.sh <version> <port>
# Example: ./deploy_vps.sh 1.0.0 8080
# Run from the directory containing the uploaded files (e.g. /home/presale/).

set -e

# ==========================================
# CONFIGURATION — EDIT THESE
# ==========================================
APP_NAME="presale_prod"
CONTAINER_NAME="presale_prod"
UPLOAD_DIR="$HOME/presale"
ASSETS_DIR="$HOME/presale/assets"

# ==========================================
# ARGUMENTS
# ==========================================
VERSION="$1"
PORT="$2"

# ==========================================
# VALIDATE ARGUMENTS
# ==========================================
if [[ -z "$VERSION" || -z "$PORT" ]]; then
    echo "[ERROR] Missing arguments."
    echo "Usage: $0 <version> <port>"
    echo "Example: $0 1.0.0 8080"
    exit 1
fi

# ==========================================
# DERIVED PATHS
# ==========================================
TAR_NAME="${APP_NAME}_v${VERSION}.tar"
ZIP_NAME="${APP_NAME}_assets_v${VERSION}.zip"
TAR_PATH="${UPLOAD_DIR}/${TAR_NAME}"
ZIP_PATH="${UPLOAD_DIR}/${ZIP_NAME}"

# ==========================================
# STEP 1: VALIDATE INPUTS
# ==========================================
echo ""
echo "[STEP 1] Validating inputs..."

if [[ ! -f "$TAR_PATH" ]]; then
    echo "[ERROR] Tar file not found: $TAR_PATH"
    exit 1
fi

if [[ ! -f "$ZIP_PATH" ]]; then
    echo "[ERROR] Assets zip not found: $ZIP_PATH"
    exit 1
fi

echo "[OK] All inputs validated."

# ==========================================
# STEP 2: DOCKER LOAD
# ==========================================
echo ""
echo "[STEP 2] Loading Docker image from: $TAR_PATH"

IMAGE_TAG=$(docker load -i "$TAR_PATH" | grep -oE 'Loaded image: \S+' | sed 's/Loaded image: //')

if [[ -z "$IMAGE_TAG" ]]; then
    echo "[ERROR] Could not determine image tag from docker load output."
    exit 1
fi

echo "[OK] Image loaded: $IMAGE_TAG"

# ==========================================
# STEP 3: EXTRACT ASSETS
# ==========================================
echo ""
echo "[STEP 3] Extracting assets to: $ASSETS_DIR"

mkdir -p "$ASSETS_DIR"
unzip -o "$ZIP_PATH" -d "$ASSETS_DIR" > /dev/null
echo "[OK] Assets extracted."

# ==========================================
# STEP 4: STOP & REMOVE OLD CONTAINER
# ==========================================
echo ""
echo "[STEP 4] Stopping and removing old container: $CONTAINER_NAME"

if docker ps -q --filter "name=^${CONTAINER_NAME}$" | grep -q .; then
    docker stop "$CONTAINER_NAME" > /dev/null
    echo "[OK] Container stopped."
else
    echo "[SKIP] No running container named $CONTAINER_NAME."
fi

if docker ps -aq --filter "name=^${CONTAINER_NAME}$" | grep -q .; then
    docker rm "$CONTAINER_NAME" > /dev/null
    echo "[OK] Container removed."
else
    echo "[SKIP] No container named $CONTAINER_NAME to remove."
fi

# ==========================================
# STEP 5: RUN NEW CONTAINER
# ==========================================
echo ""
echo "[STEP 5] Starting new container on port $PORT..."

docker run -d \
    --name "$CONTAINER_NAME" \
    --restart unless-stopped \
    -p "$PORT:80" \
    -v "$ASSETS_DIR:/usr/share/nginx/html/assets/assets" \
    "$IMAGE_TAG" > /dev/null

echo "[OK] Container started."

# ==========================================
# STEP 6: CLEANUP
# ==========================================
echo ""
echo "[STEP 6] Cleaning up uploaded files..."

if [[ -f "$TAR_PATH" ]]; then rm -f "$TAR_PATH"; fi
if [[ -f "$ZIP_PATH" ]]; then rm -f "$ZIP_PATH"; fi
echo "[OK] Uploaded files cleaned up."

echo ""
echo "[DONE] Deployment complete."
echo "       Container: $CONTAINER_NAME"
echo "       Port:      $PORT"
echo "       Image:     $IMAGE_TAG"
echo ""
