@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: CONFIGURATION — EDIT THESE
:: ==========================================
set "VPS_KEY_NAME=~/.ssh/217.18.62.204"
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
    echo Usage: build_docker.bat ^<consumer_folder^> ^<version^>
    echo Example: build_docker.bat my_consumer 1.0.0
    exit /b 1
)

if "%VERSION%"=="" (
    echo [ERROR] Missing argument: version
    echo Usage: build_docker.bat ^<consumer_folder^> ^<version^>
    echo Example: build_docker.bat my_consumer 1.0.0
    exit /b 1
)

:: ==========================================
:: DERIVED PATHS
:: ==========================================
set "PROJECT_DIR=%~dp0"
set "ASSETS_DIR=%PROJECT_DIR%assets"
set "CONSUMER_ASSETS_DIR=%PROJECT_DIR%%CONSUMER_FOLDER%\assets"
set "DART_DEFINE_FILE=%PROJECT_DIR%%CONSUMER_FOLDER%dart_define_file.json"
set "TAR_NAME=%APP_NAME%_v%VERSION%.tar"
set "TAR_PATH=%PROJECT_DIR%scripts\%TAR_NAME%"
set "ZIP_NAME=%APP_NAME%_assets_v%VERSION%.zip"
set "ZIP_PATH=%PROJECT_DIR%scripts\%ZIP_NAME%"
set "IMAGE_TAG=%APP_NAME%:%VERSION%"

:: ==========================================
:: STEP 1: DELETE assets/*
:: ==========================================
echo.
echo [STEP 1] Cleaning assets directory: %ASSETS_DIR%

if exist "%ASSETS_DIR%" (
    rd /s /q "%ASSETS_DIR%"
    if errorlevel 1 (
        echo [ERROR] Failed to delete assets directory.
        exit /b 1
    )
    echo [OK] Assets directory deleted.
) else (
    echo [SKIP] Assets directory does not exist, skipping deletion.
)

:: ==========================================
:: STEP 2: COPY consumer assets -> assets/
:: ==========================================
echo.
echo [STEP 2] Copying assets from: %CONSUMER_ASSETS_DIR%

if not exist "%CONSUMER_ASSETS_DIR%" (
    echo [ERROR] Source directory not found: %CONSUMER_ASSETS_DIR%
    exit /b 1
)

mkdir "%ASSETS_DIR%"
xcopy "%CONSUMER_ASSETS_DIR%\*" "%ASSETS_DIR%\" /E /I /H /Y
if errorlevel 1 (
    echo [ERROR] Failed to copy assets.
    exit /b 1
)
echo [OK] Assets copied successfully.

:: ==========================================
:: STEP 3: VALIDATE dart-define-file
:: ==========================================
echo.
echo [STEP 3] Validating dart-define-file: %DART_DEFINE_FILE%

if not exist "%DART_DEFINE_FILE%" (
    echo [ERROR] dart-define-file not found: %DART_DEFINE_FILE%
    exit /b 1
)
echo [OK] dart-define-file found.

:: ==========================================
:: STEP 4: FVM FLUTTER CLEAN
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

:: --- Read dart-define-file.json ---
set "DART_DEFINE_CONTENT="
for /f "usebackq delims=" %%i in ("%DART_DEFINE_FILE%") do (
    set "DART_DEFINE_CONTENT=!DART_DEFINE_CONTENT!%%i"
)

if "!DART_DEFINE_CONTENT!"=="" (
    echo [ERROR] Failed to read dart-define-file.json content.
    exit /b 1
)
echo [OK] dart-define-file.json content read.

:: --- Read flutter_launcher_icons.yaml ---
set "LAUNCHER_ICONS_FILE=%PROJECT_DIR%.consumer_env\flutter_launcher_icons.yaml"

if not exist "%LAUNCHER_ICONS_FILE%" (
    echo [ERROR] flutter_launcher_icons.yaml not found: %LAUNCHER_ICONS_FILE%
    exit /b 1
)

set "LAUNCHER_ICONS_CONTENT="
for /f "usebackq delims=" %%i in ("%LAUNCHER_ICONS_FILE%") do (
    set "LAUNCHER_ICONS_CONTENT=!LAUNCHER_ICONS_CONTENT!%%i"
)

if "!LAUNCHER_ICONS_CONTENT!"=="" (
    echo [ERROR] Failed to read flutter_launcher_icons.yaml content.
    exit /b 1
)
echo [OK] flutter_launcher_icons.yaml content read.

:: --- Build docker image passing both args ---
docker build -f "./scripts/dockerfile_prod" ^
    --build-arg DART_DEFINE_FILE_CONTENT="%DART_DEFINE_CONTENT%" ^
    --build-arg LAUNCHER_ICONS_CONTENT="%LAUNCHER_ICONS_CONTENT%" ^
    -t "%IMAGE_TAG%" .

if errorlevel 1 (
    echo [ERROR] Docker build failed.
    exit /b 1
)
echo [OK] Docker image built.

:: ==========================================
:: STEP 7: DOCKER SAVE TO TAR
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
echo [STEP 8] Zipping assets folder: %ASSETS_DIR%

:: Delete old zip if exists
if exist "%ZIP_PATH%" del /f /q "%ZIP_PATH%"

:: Use PowerShell to zip
powershell -Command "Compress-Archive -Path '%ASSETS_DIR%\*' -DestinationPath '%ZIP_PATH%'"
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
echo [OK] Docker tar uploaded.

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
:: STEP 11: SSH INTO VPS
:: ==========================================
echo.
echo [STEP 11] Connecting to VPS via SSH...

ssh -i "%USERPROFILE%\.ssh\%VPS_KEY_NAME%" "%VPS_USER%@%VPS_IP%"
if errorlevel 1 (
    echo [ERROR] SSH connection failed.
    exit /b 1
)

:: ==========================================
:: STEP 12: DELETE LOCAL TAR AND ZIP
:: ==========================================
echo.
echo [STEP 12] Cleaning up local files...

if exist "%TAR_PATH%" (
    del /f /q "%TAR_PATH%"
    echo [OK] Local tar deleted.
)

if exist "%ZIP_PATH%" (
    del /f /q "%ZIP_PATH%"
    echo [OK] Local zip deleted.
)

echo.
echo [DONE] All steps completed successfully.
echo        Image: %IMAGE_TAG%
echo        Tar:   /home/presale/%TAR_NAME%
echo        Zip:   /home/presale/%ZIP_NAME%
echo.
endlocal