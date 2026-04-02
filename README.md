# Presale

Flutter cross-platform application (Web, Windows, macOS).
Uses FVM (Flutter Version Manager) with Flutter 3.35.1.

## Prerequisites

- [FVM](https://fvm.app/) with Flutter 3.35.1
- [Docker](https://www.docker.com/) (for web/prod builds)
- [Inno Setup 6](https://jrsoftware.org/isinfo.php) (for Windows installer only)

## Consumer Configuration

Each build requires a `<consumer_folder>` — a directory inside `.consumer_env/` containing:

```
.consumer_env/
  <consumer_folder>/
    assets/                # consumer-specific assets
    dart_define_file.json  # runtime config (API endpoints, feature flags)
  flutter_launcher_icons.yaml
```

## Quick Reference

### Dev Run

```bat
run.bat <consumer_folder> <platform>
```

| Platform  | Value     |
|-----------|-----------|
| Windows   | `windows` |
| Web       | `chrome`  |
| macOS     | `macos`   |

Example: `run.bat consumer_0 chrome`

### Build Windows EXE

```bat
build_to_windows.bat <consumer_folder>
```

Output: `build\windows\x64\runner\Release\`

### Build Windows Installer

```bat
build_and_pack_to_exe.bat <consumer_folder>
```

Output: `scripts\output\presale_v<version>_setup.exe`
Requires Inno Setup 6 installed at `C:\Program Files (x86)\Inno Setup 6\`.

### Build & Deploy Web (Production)

**Windows:**
```bat
build_prod.bat <consumer_folder> <version>
```

**macOS:**
```bash
./scripts/build_prod.sh <consumer_folder> <version>
```

Example: `build_prod.bat consumer_0 1.0.0`

Builds Docker image, uploads to VPS, then run on server:
```bash
./deploy_vps.sh <tar_file> <assets_zip> <port>
```

## Project Structure (Scripts)

```
run.bat                    # dev run (any platform)
build_to_windows.bat       # build Windows EXE
build_and_pack_to_exe.bat  # build + create installer
build_prod.bat             # production web build + deploy (Windows)
Dockerfile                 # dev web Docker image
scripts/
  build_prod.sh            # production web build + deploy (macOS)
  deploy_vps.sh            # VPS deployment (runs on server)
  dockerfile_prod          # production Docker image
  installer.iss            # Inno Setup script
  nginx.conf               # Nginx config for web
```
