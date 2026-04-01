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
set "PROJECT_DIR_NOSLASH=%~dp0"
if "%PROJECT_DIR_NOSLASH:~-1%"=="\" set "PROJECT_DIR_NOSLASH=%PROJECT_DIR_NOSLASH:~0,-1%"
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
    -t "%IMAGE_TAG%" "%PROJECT_DIR_NOSLASH%"

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
