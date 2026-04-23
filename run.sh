#!/usr/bin/env bash
# Usage: ./run.sh <consumer_folder> <platform>
# Example: ./run.sh my_consumer macos

set -e

# ==========================================
# CONFIGURATION
# ==========================================
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONSUMER_FOLDER="$1"
PLATFORM="$2"

# ==========================================
# VALIDATE ARGUMENTS
# ==========================================
if [[ -z "$CONSUMER_FOLDER" ]]; then
    echo "[ERROR] Missing argument: consumer_folder"
    echo "Usage: $0 <consumer_folder> <platform>"
    echo "Example: $0 my_consumer macos"
    exit 1
fi

if [[ -z "$PLATFORM" ]]; then
    echo "[ERROR] Missing argument: platform"
    echo "Usage: $0 <consumer_folder> <platform>"
    echo "Example: $0 my_consumer macos"
    exit 1
fi

PLATFORM_LC=$(echo "$PLATFORM" | tr '[:upper:]' '[:lower:]')
if [[ "$PLATFORM_LC" != "macos" && "$PLATFORM_LC" != "chrome" && "$PLATFORM_LC" != "ios" ]]; then
    echo "[ERROR] Invalid platform: \"$PLATFORM\""
    echo "Allowed values: macos, chrome, ios"
    exit 1
fi

# ==========================================
# DERIVED PATHS
# ==========================================
ASSETS_DIR="$PROJECT_DIR/assets"
CONSUMER_ASSETS_DIR="$PROJECT_DIR/$CONSUMER_FOLDER/assets"
DART_DEFINE_FILE="$PROJECT_DIR/$CONSUMER_FOLDER/dart_define_file.json"
LAUNCHER_ICONS_FILE="$PROJECT_DIR/.consumer_env/flutter_launcher_icons.yaml"

# ==========================================
# STEP 1: DELETE assets/* directory
# ==========================================
echo ""
echo "[STEP 1] Cleaning assets directory: $ASSETS_DIR"

if [[ -d "$ASSETS_DIR" ]]; then
    rm -rf "$ASSETS_DIR"
    echo "[OK] Assets directory deleted."
else
    echo "[SKIP] Assets directory does not exist, skipping deletion."
fi

# ==========================================
# STEP 2: COPY consumer assets -> assets/
# ==========================================
echo ""
echo "[STEP 2] Copying assets from: $CONSUMER_ASSETS_DIR"

if [[ ! -d "$CONSUMER_ASSETS_DIR" ]]; then
    echo "[ERROR] Source directory not found: $CONSUMER_ASSETS_DIR"
    exit 1
fi

mkdir -p "$ASSETS_DIR"
cp -R "$CONSUMER_ASSETS_DIR/." "$ASSETS_DIR/"
echo "[OK] Assets copied successfully."

# ==========================================
# STEP 3: VALIDATE dart-define-file
# ==========================================
echo ""
echo "[STEP 3] Validating dart-define-file: $DART_DEFINE_FILE"

if [[ ! -f "$DART_DEFINE_FILE" ]]; then
    echo "[ERROR] dart-define-file not found: $DART_DEFINE_FILE"
    exit 1
fi
echo "[OK] dart-define-file found."

# ==========================================
# STEP 4: RUN FLUTTER APP
# ==========================================
echo ""
echo "[STEP 4] Running Flutter app..."
echo "         Platform:         $PLATFORM_LC"
echo "         dart-define-file: $DART_DEFINE_FILE"
echo ""

cd "$PROJECT_DIR"
fvm flutter pub run flutter_launcher_icons -f "$LAUNCHER_ICONS_FILE"
cli="fvm flutter run --dart-define-from-file=$DART_DEFINE_FILE -d $PLATFORM_LC"
echo "$cli"
fvm flutter run --dart-define-from-file="$DART_DEFINE_FILE" -d "$PLATFORM_LC"
echo
echo ""
echo "[DONE] All steps completed successfully."
