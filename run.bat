@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: CONFIGURATION
:: ==========================================
set "PROJECT_DIR=%~dp0"
set "CONSUMER_FOLDER=%~1"
set "PLATFORM=%~2"

:: ==========================================
:: VALIDATE ARGUMENTS
:: ==========================================
if "%CONSUMER_FOLDER%"=="" (
    echo [ERROR] Missing argument: consumer_folder
    echo Usage: run.bat ^<consumer_folder^> ^<platform^>
    echo Example: run.bat my_consumer windows
    exit /b 1
)

if "%PLATFORM%"=="" (
    echo [ERROR] Missing argument: platform
    echo Usage: run.bat ^<consumer_folder^> ^<platform^>
    echo Example: run.bat my_consumer windows
    exit /b 1
)

:: Validate platform value
if /I not "%PLATFORM%"=="windows" (
    if /I not "%PLATFORM%"=="chrome" (
        if /I not "%PLATFORM%"=="macos" (
            echo [ERROR] Invalid platform: "%PLATFORM%"
            echo Allowed values: windows, web, macos
            exit /b 1
        )
    )
)

:: ==========================================
:: DERIVED PATHS
:: ==========================================
set "ASSETS_DIR=%PROJECT_DIR%assets"
set "CONSUMER_ASSETS_DIR=%PROJECT_DIR%%CONSUMER_FOLDER%\assets"
set "DART_DEFINE_FILE=%PROJECT_DIR%%CONSUMER_FOLDER%\dart_define_file.json"

:: ==========================================
:: STEP 1: DELETE assets/* directory
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
:: STEP 4: RUN FLUTTER APP
:: ==========================================
echo.
echo [STEP 4] Running Flutter app...
echo          Platform:         %PLATFORM%
echo          dart-define-file: %DART_DEFINE_FILE%
echo.
fvm flutter pub run flutter_launcher_icons -f .\.consumer_env\flutter_launcher_icons.yaml
fvm flutter run --dart-define-from-file="%DART_DEFINE_FILE%" -d "%PLATFORM%"
if errorlevel 1 (
    echo [ERROR] Flutter run failed.
    exit /b 1
)

echo.
echo [DONE] All steps completed successfully.
endlocal