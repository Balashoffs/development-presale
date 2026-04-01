# Presale Build & Deploy Pipeline — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Generate cross-platform build scripts (Windows + Mac) and a VPS deploy script that cleanly replace the existing `build_vps.bat` / `build_image_prod.sh` with a consumer-selectable, volume-mounted-assets pipeline.

**Architecture:** The build side encodes two config files (dart-define JSON + launcher icons YAML) as base64 and passes them to `dockerfile_prod` as build args; the built image is saved as a tar and uploaded alongside a zipped copy of the consumer's assets. On the VPS, `deploy_vps.sh` loads the image, extracts assets, stops any old container named `presale_prod`, and starts the new one with the assets volume mounted and a caller-specified port.

**Tech Stack:** Windows CMD (batch), zsh/bash, Docker, scp, unzip, openssl (base64 on Mac)

---

## File Map

| Action | Path | Responsibility |
|---|---|---|
| Modify | `scripts/dockerfile_prod` | Fix base image, remove flutter doctor + VOLUME declaration |
| Create | `scripts/deploy_vps.sh` | VPS: load image, extract assets, replace container |
| Create | `scripts/build_prod.sh` | Mac: clean assets, build image, upload to VPS |
| Create | `build_prod.bat` | Windows: same flow as build_prod.sh |

---

## Task 1: Update dockerfile_prod

**Files:**
- Modify: `scripts/dockerfile_prod`

Three targeted changes: deterministic base image, remove slow `flutter doctor`, remove misleading `VOLUME` directive.

- [ ] **Step 1: Apply the three changes**

Replace the first line of the build stage and remove two stanzas. Final `scripts/dockerfile_prod`:

```dockerfile
# Environment to install flutter and build web
FROM debian:bookworm-slim AS build-env

# install all needed stuff
RUN apt-get update
RUN apt-get install -y curl git unzip

# define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.35.1
ARG APP=/app/

#clone flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
# change dir to current flutter folder and make a checkout to the specific version
RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

# setup the flutter path as an environmental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# create folder and set as working directory
RUN mkdir $APP
WORKDIR $APP

# Copy project files first
COPY . $APP

# Build args for dynamic config (passed via --build-arg)
ARG DART_DEFINE_FILE_CONTENT
ARG LAUNCHER_ICONS_CONTENT

# Write dart-define-file.json from build arg
RUN printf '%s' "$DART_DEFINE_FILE_CONTENT" | base64 -d > /app/dart-define-file.json

# Write flutter_launcher_icons.yaml from build arg
RUN mkdir -p /app/.consumer_env && \
    printf '%s' "$LAUNCHER_ICONS_CONTENT" | base64 -d > /app/.consumer_env/flutter_launcher_icons.yaml

# Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub get
RUN flutter pub run flutter_launcher_icons -f .consumer_env/flutter_launcher_icons.yaml
RUN flutter build web --release --dart-define-from-file=/app/dart-define-file.json --dart-define=timestamp=`date +%s`

# use nginx to deploy
FROM nginx:1.27.3-alpine

# copy the compiled web app to nginx
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

- [ ] **Step 2: Commit**

```bash
git add scripts/dockerfile_prod
git commit -m "fix: update dockerfile_prod — deterministic base image, remove flutter doctor and VOLUME"
```

---

## Task 2: Create deploy_vps.sh

**Files:**
- Create: `scripts/deploy_vps.sh`

Linux script run manually on VPS after the build script uploads tar + zip.

- [ ] **Step 1: Write the script**

Create `scripts/deploy_vps.sh`:

```bash
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
```

- [ ] **Step 2: Syntax check**

```bash
bash -n scripts/deploy_vps.sh
```

Expected: no output (clean parse).

- [ ] **Step 3: Make executable and commit**

```bash
chmod +x scripts/deploy_vps.sh
git add scripts/deploy_vps.sh
git commit -m "feat: add deploy_vps.sh — load image, extract assets, replace container"
```

---

## Task 3: Create build_prod.sh (Mac)

**Files:**
- Create: `scripts/build_prod.sh`

Mac/Linux build script. Uses `openssl base64 -A` for line-wrap-free base64 (works on both macOS and Linux, unlike `base64 -w0` which is GNU-only).

- [ ] **Step 1: Write the script**

Create `scripts/build_prod.sh`:

```bash
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

scp -i "$HOME/.ssh/$VPS_KEY_NAME" "$TAR_PATH" "$VPS_USER@$VPS_IP:/home/presale/$TAR_NAME"
echo "[OK] Tar uploaded."

# ==========================================
# STEP 10: SCP ZIP TO VPS
# ==========================================
echo ""
echo "[STEP 10] Uploading assets zip to VPS..."

scp -i "$HOME/.ssh/$VPS_KEY_NAME" "$ZIP_PATH" "$VPS_USER@$VPS_IP:/home/presale/$ZIP_NAME"
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
```

- [ ] **Step 2: Syntax check**

```bash
bash -n scripts/build_prod.sh
```

Expected: no output (clean parse).

- [ ] **Step 3: Make executable and commit**

```bash
chmod +x scripts/build_prod.sh
git add scripts/build_prod.sh
git commit -m "feat: add build_prod.sh — Mac/Linux consumer build and upload pipeline"
```

---

## Task 4: Create build_prod.bat (Windows)

**Files:**
- Create: `build_prod.bat`

Windows CMD equivalent of `build_prod.sh`. Uses PowerShell for base64 encoding (no GNU tools required) and `Compress-Archive` for zipping.

- [ ] **Step 1: Write the script**

Create `build_prod.bat` in the project root:

```bat
@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: CONFIGURATION — EDIT THESE
:: ==========================================
set "VPS_KEY_NAME=217.18.62.204"
set "VPS_USER=root"
set "VPS_IP=217.18.62.204"
set "APP_NAME=presale_prod"

:: ==========================================
:: ARGUMENTS
:: ==========================================
set "CONSUMER_FOLDER=%~1"
set "VERSION=%~2"

:: ==========================================
:: VALIDATE ARGUMENTS
:: ==========================================
if "%CONSUMER_FOLDER%"=="" (
    echo [ERROR] Missing argument: consumer_folder
    echo Usage: build_prod.bat ^<consumer_folder^> ^<version^>
    echo Example: build_prod.bat consumer_0 1.0.0
    exit /b 1
)

if "%VERSION%"=="" (
    echo [ERROR] Missing argument: version
    echo Usage: build_prod.bat ^<consumer_folder^> ^<version^>
    echo Example: build_prod.bat consumer_0 1.0.0
    exit /b 1
)

:: ==========================================
:: DERIVED PATHS
:: ==========================================
set "PROJECT_DIR=%~dp0"
set "ASSETS_DIR=%PROJECT_DIR%assets"
set "CONSUMER_ENV_DIR=%PROJECT_DIR%.consumer_env\%CONSUMER_FOLDER%"
set "CONSUMER_ASSETS_DIR=%CONSUMER_ENV_DIR%\assets"
set "DART_DEFINE_FILE=%CONSUMER_ENV_DIR%\dart_define_file.json"
set "LAUNCHER_ICONS_FILE=%PROJECT_DIR%.consumer_env\flutter_launcher_icons.yaml"
set "IMAGE_TAG=%APP_NAME%:%VERSION%"
set "TAR_NAME=%APP_NAME%_v%VERSION%.tar"
set "TAR_PATH=%PROJECT_DIR%scripts\%TAR_NAME%"
set "ZIP_NAME=%APP_NAME%_assets_v%VERSION%.zip"
set "ZIP_PATH=%PROJECT_DIR%scripts\%ZIP_NAME%"

:: ==========================================
:: STEP 1: VALIDATE INPUTS
:: ==========================================
echo.
echo [STEP 1] Validating inputs...

if not exist "%CONSUMER_ASSETS_DIR%" (
    echo [ERROR] Consumer assets folder not found: %CONSUMER_ASSETS_DIR%
    exit /b 1
)

if not exist "%DART_DEFINE_FILE%" (
    echo [ERROR] dart_define_file.json not found: %DART_DEFINE_FILE%
    exit /b 1
)

if not exist "%LAUNCHER_ICONS_FILE%" (
    echo [ERROR] flutter_launcher_icons.yaml not found: %LAUNCHER_ICONS_FILE%
    exit /b 1
)

echo [OK] All inputs validated.

:: ==========================================
:: STEP 2: CLEAN ASSETS
:: ==========================================
echo.
echo [STEP 2] Cleaning assets directory...

if exist "%ASSETS_DIR%" (
    rd /s /q "%ASSETS_DIR%"
    if errorlevel 1 (
        echo [ERROR] Failed to delete assets directory.
        exit /b 1
    )
    echo [OK] Assets directory deleted.
) else (
    echo [SKIP] Assets directory does not exist.
)

:: ==========================================
:: STEP 3: COPY CONSUMER ASSETS
:: ==========================================
echo.
echo [STEP 3] Copying assets from: %CONSUMER_ASSETS_DIR%

mkdir "%ASSETS_DIR%"
xcopy "%CONSUMER_ASSETS_DIR%\*" "%ASSETS_DIR%\" /E /I /H /Y
if errorlevel 1 (
    echo [ERROR] Failed to copy assets.
    exit /b 1
)
echo [OK] Assets copied.

:: ==========================================
:: STEP 4: FLUTTER CLEAN
:: ==========================================
echo.
echo [STEP 4] Running fvm flutter clean...

cd /d "%PROJECT_DIR%"
fvm flutter clean
if errorlevel 1 (
    echo [ERROR] fvm flutter clean failed.
    exit /b 1
)
echo [OK] Flutter clean done.

:: ==========================================
:: STEP 5: BUILD RUNNER
:: ==========================================
echo.
echo [STEP 5] Running build_runner...

fvm dart run build_runner build -d
if errorlevel 1 (
    echo [ERROR] build_runner failed.
    exit /b 1
)
echo [OK] build_runner done.

:: ==========================================
:: STEP 6: DOCKER BUILD
:: ==========================================
echo.
echo [STEP 6] Building Docker image: %IMAGE_TAG%

:: Base64-encode dart_define_file.json via PowerShell (no line wrapping)
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "[Convert]::ToBase64String([IO.File]::ReadAllBytes('%DART_DEFINE_FILE%'))"`) do (
    set "DART_DEFINE_B64=%%i"
)

if "!DART_DEFINE_B64!"=="" (
    echo [ERROR] Failed to base64-encode dart_define_file.json.
    exit /b 1
)

:: Base64-encode flutter_launcher_icons.yaml via PowerShell
for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "[Convert]::ToBase64String([IO.File]::ReadAllBytes('%LAUNCHER_ICONS_FILE%'))"`) do (
    set "LAUNCHER_ICONS_B64=%%i"
)

if "!LAUNCHER_ICONS_B64!"=="" (
    echo [ERROR] Failed to base64-encode flutter_launcher_icons.yaml.
    exit /b 1
)

set DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -f "%PROJECT_DIR%scripts\dockerfile_prod" ^
    --build-arg "DART_DEFINE_FILE_CONTENT=!DART_DEFINE_B64!" ^
    --build-arg "LAUNCHER_ICONS_CONTENT=!LAUNCHER_ICONS_B64!" ^
    -t "%IMAGE_TAG%" "%PROJECT_DIR%"

if errorlevel 1 (
    echo [ERROR] Docker build failed.
    exit /b 1
)
echo [OK] Docker image built.

:: ==========================================
:: STEP 7: DOCKER SAVE
:: ==========================================
echo.
echo [STEP 7] Saving Docker image to tar: %TAR_PATH%

docker save -o "%TAR_PATH%" "%IMAGE_TAG%"
if errorlevel 1 (
    echo [ERROR] Docker save failed.
    exit /b 1
)
echo [OK] Docker image saved.

:: ==========================================
:: STEP 8: ZIP ASSETS
:: ==========================================
echo.
echo [STEP 8] Zipping assets...

if exist "%ZIP_PATH%" del /f /q "%ZIP_PATH%"

powershell -NoProfile -Command "Compress-Archive -Path '%ASSETS_DIR%\*' -DestinationPath '%ZIP_PATH%'"
if errorlevel 1 (
    echo [ERROR] Failed to zip assets.
    exit /b 1
)
echo [OK] Assets zipped: %ZIP_NAME%

:: ==========================================
:: STEP 9: SCP TAR TO VPS
:: ==========================================
echo.
echo [STEP 9] Uploading tar to VPS...

scp -i "%USERPROFILE%\.ssh\%VPS_KEY_NAME%" "%TAR_PATH%" "%VPS_USER%@%VPS_IP%:/home/presale/%TAR_NAME%"
if errorlevel 1 (
    echo [ERROR] SCP tar upload failed.
    exit /b 1
)
echo [OK] Tar uploaded.

:: ==========================================
:: STEP 10: SCP ZIP TO VPS
:: ==========================================
echo.
echo [STEP 10] Uploading assets zip to VPS...

scp -i "%USERPROFILE%\.ssh\%VPS_KEY_NAME%" "%ZIP_PATH%" "%VPS_USER%@%VPS_IP%:/home/presale/%ZIP_NAME%"
if errorlevel 1 (
    echo [ERROR] SCP zip upload failed.
    exit /b 1
)
echo [OK] Assets zip uploaded.

:: ==========================================
:: STEP 11: CLEANUP
:: ==========================================
echo.
echo [STEP 11] Cleaning up local files...

if exist "%TAR_PATH%" del /f /q "%TAR_PATH%"
if exist "%ZIP_PATH%" del /f /q "%ZIP_PATH%"
echo [OK] Local files cleaned up.

echo.
echo [DONE] Build and upload complete.
echo        Image: %IMAGE_TAG%
echo        On VPS run: ./deploy_vps.sh %TAR_NAME% %ZIP_NAME% ^<port^>
echo.
endlocal
```

- [ ] **Step 2: Verify the file exists and is non-empty**

```bash
wc -l build_prod.bat
```

Expected: line count greater than 0.

- [ ] **Step 3: Commit**

```bash
git add build_prod.bat
git commit -m "feat: add build_prod.bat — Windows consumer build and upload pipeline"
```
