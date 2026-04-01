#!/usr/bin/env bash
# Usage: ./deploy_vps.sh <tar_file> <assets_zip> <port>
# Example: ./deploy_vps.sh presale_prod_v1.0.0.tar presale_prod_assets_v1.0.0.zip 8080
# Run from the directory containing the uploaded files (e.g. /home/presale/).

set -e

# ==========================================
# ARGUMENTS
# ==========================================
TAR_FILE="$1"
ASSETS_ZIP="$2"
PORT="$3"
CONTAINER_NAME="presale_prod"
ASSETS_DIR="/home/presale/assets"

# ==========================================
# VALIDATE ARGUMENTS
# ==========================================
if [[ -z "$TAR_FILE" || -z "$ASSETS_ZIP" || -z "$PORT" ]]; then
    echo "[ERROR] Missing arguments."
    echo "Usage: $0 <tar_file> <assets_zip> <port>"
    echo "Example: $0 presale_prod_v1.0.0.tar presale_prod_assets_v1.0.0.zip 8080"
    exit 1
fi

if [[ ! -f "$TAR_FILE" ]]; then
    echo "[ERROR] Tar file not found: $TAR_FILE"
    exit 1
fi

if [[ ! -f "$ASSETS_ZIP" ]]; then
    echo "[ERROR] Assets zip not found: $ASSETS_ZIP"
    exit 1
fi

echo "[OK] Arguments validated."

# ==========================================
# STEP 1: DOCKER LOAD
# ==========================================
echo ""
echo "[STEP 1] Loading Docker image from: $TAR_FILE"

IMAGE_TAG=$(docker load -i "$TAR_FILE" | grep -oE 'Loaded image: \S+' | sed 's/Loaded image: //')

if [[ -z "$IMAGE_TAG" ]]; then
    echo "[ERROR] Could not determine image tag from docker load output."
    exit 1
fi

echo "[OK] Image loaded: $IMAGE_TAG"

# ==========================================
# STEP 2: EXTRACT ASSETS
# ==========================================
echo ""
echo "[STEP 2] Extracting assets to: $ASSETS_DIR"

mkdir -p "$ASSETS_DIR"
unzip -o "$ASSETS_ZIP" -d "$ASSETS_DIR"
echo "[OK] Assets extracted."

# ==========================================
# STEP 3: STOP & REMOVE OLD CONTAINER
# ==========================================
echo ""
echo "[STEP 3] Stopping and removing old container: $CONTAINER_NAME"

if docker ps -q --filter "name=^${CONTAINER_NAME}$" | grep -q .; then
    docker stop "$CONTAINER_NAME"
    echo "[OK] Container stopped."
else
    echo "[SKIP] No running container named $CONTAINER_NAME."
fi

if docker ps -aq --filter "name=^${CONTAINER_NAME}$" | grep -q .; then
    docker rm "$CONTAINER_NAME"
    echo "[OK] Container removed."
else
    echo "[SKIP] No container named $CONTAINER_NAME to remove."
fi

# ==========================================
# STEP 4: RUN NEW CONTAINER
# ==========================================
echo ""
echo "[STEP 4] Starting new container on port $PORT..."

docker run -d \
    --name "$CONTAINER_NAME" \
    --restart unless-stopped \
    -p "$PORT:80" \
    -v "$ASSETS_DIR:/usr/share/nginx/html/assets" \
    "$IMAGE_TAG"

echo "[OK] Container started."

echo ""
echo "[DONE] Deployment complete."
echo "       Container: $CONTAINER_NAME"
echo "       Port:      $PORT"
echo "       Image:     $IMAGE_TAG"
echo ""
