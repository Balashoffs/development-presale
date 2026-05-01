@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: ARGUMENTS
:: ==========================================
set "CONSUMER_FOLDER=%~1"

:: ==========================================
:: VALIDATE ARGUMENTS
:: ==========================================
if "%CONSUMER_FOLDER%"=="" (
    echo [ERROR] Missing argument: consumer_folder
    echo Usage: build_windows.bat ^<consumer_folder^>
    echo Example: build_windows.bat my_consumer
    exit /b 1
)

:: ==========================================
:: DERIVED PATHS
:: ==========================================
set "PROJECT_DIR=%~dp0"
set "ASSETS_DIR=%PROJECT_DIR%assets"
set "CONSUMER_ASSETS_DIR=%PROJECT_DIR%%CONSUMER_FOLDER%\assets"
set "DART_DEFINE_FILE=%PROJECT_DIR%%CONSUMER_FOLDER%\dart_define_file.json"

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
:: STEP 6: BUILD WINDOWS EXE
:: ==========================================
echo.
echo [STEP 6] Building Windows EXE...
echo          dart-define-file: %DART_DEFINE_FILE%
echo.
fvm flutter pub run flutter_launcher_icons -f .\.consumer_env\flutter_launcher_icons.yaml
fvm flutter build windows --dart-define-from-file="%DART_DEFINE_FILE%"

if errorlevel 1 (
    echo [ERROR] Flutter build windows failed.
    exit /b 1
)
echo [OK] Windows EXE built successfully.

echo.
echo [DONE] Build completed successfully.
echo        Output: %PROJECT_DIR%build\windows\x64\runner\Release\
echo.
endlocal