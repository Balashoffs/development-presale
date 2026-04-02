# Presale Build & Deploy Pipeline — Design Spec

**Date:** 2026-04-01
**Status:** Approved

---

## Overview

A cross-platform build and deploy pipeline for the `presale` Flutter web app. The pipeline supports multiple consumer configurations (`consumer_0`, `consumer_1`, `consumer_2`), builds a Docker image containing the Flutter web app served via nginx, and deploys it to a VPS. Assets are mounted as a volume at runtime so they can be updated independently of the image.

---

## Files to Generate

| File | Platform | Purpose |
|---|---|---|
| `build_prod.bat` | Windows (CMD) | Build image, save tar+zip, scp to VPS |
| `scripts/build_prod.sh` | Mac/Linux (bash/zsh) | Same as above |
| `scripts/deploy_vps.sh` | Linux VPS | Load image, extract assets, run container |
| `scripts/dockerfile_prod` | Docker | Updated — cleanup only, no structural changes |

---

## Architecture

```
[Local Windows/Mac]                          [VPS Linux]
  build_prod.bat / build_prod.sh              deploy_vps.sh
        │                                           │
  1. Validate args                          1. docker load <tar>
  2. Clean assets/                          2. unzip assets → /home/presale/assets/
  3. Copy .consumer_env/<consumer>/assets/  3. Stop & remove old presale_prod container
  4. Docker build (dockerfile_prod)         4. docker run -d
     - dart_define_file.json (base64)           -p <port>:80
     - flutter_launcher_icons.yaml (base64)     -v /home/presale/assets:/usr/share/nginx/html/assets
  5. docker save → presale_prod_v<v>.tar        --restart unless-stopped
  6. zip assets/ → presale_prod_assets_v<v>.zip
  7. scp tar + zip → VPS /home/presale/
  8. cleanup local tar + zip
```

---

## Script Interfaces

### Build scripts (Windows + Mac)

```
build_prod.bat <consumer_folder> <version>
scripts/build_prod.sh <consumer_folder> <version>
```

Example:
```
build_prod.bat consumer_0 1.2.0
./scripts/build_prod.sh consumer_0 1.2.0
```

**Configuration block at top of each script:**
- `VPS_KEY_NAME` — SSH key filename (under `~/.ssh/`)
- `VPS_USER` — SSH user
- `VPS_IP` — VPS IP address
- `APP_NAME` — image/app name (default: `presale_prod`)

**Derived values:**
- Image tag: `presale_prod:<version>`
- Tar filename: `presale_prod_v<version>.tar`
- Zip filename: `presale_prod_assets_v<version>.zip`
- dart-define source: `.consumer_env/<consumer_folder>/dart_define_file.json`
- Assets source: `.consumer_env/<consumer_folder>/assets/`
- Launcher icons: `.consumer_env/flutter_launcher_icons.yaml`

### VPS deploy script (Linux)

```
./deploy_vps.sh <tar_file> <assets_zip> <port>
```

Example:
```
./deploy_vps.sh presale_prod_v1.2.0.tar presale_prod_assets_v1.2.0.zip 8080
```

Files are expected to exist in the current directory (placed there by scp from build script).

---

## Build Script Steps (both platforms)

1. **Validate args** — exit with usage message if `<consumer_folder>` or `<version>` missing
2. **Clean `assets/`** — delete entire folder if exists
3. **Copy assets** — copy `.consumer_env/<consumer_folder>/assets/*` → `assets/`
4. **Validate inputs** — check `dart_define_file.json` and `flutter_launcher_icons.yaml` exist
5. **fvm flutter clean** — clean Flutter build artifacts
6. **build_runner** — `fvm dart run build_runner build -d`
7. **Docker build** — base64-encode both config files, pass as `--build-arg` to `dockerfile_prod`
8. **Docker save** — export image to `scripts/<tar_name>`
9. **Zip assets** — compress `assets/` to `scripts/<zip_name>`
10. **SCP tar** — upload tar to VPS `/home/presale/`
11. **SCP zip** — upload zip to VPS `/home/presale/`
12. **Cleanup** — delete local tar and zip from `scripts/`

> Note: Script does NOT auto-SSH into VPS after upload. User runs `deploy_vps.sh` manually.

---

## VPS Deploy Script Steps

1. **Validate args** — exit if tar, zip, or port missing
2. **docker load** — load image from tar file
3. **Extract assets** — `unzip -o <zip> -d /home/presale/assets/`
4. **Stop old container** — find any running container from `presale_prod` image, stop and remove it
5. **docker run** — start new container:
   - `--name presale_prod`
   - `--restart unless-stopped`
   - `-p <port>:80`
   - `-v /home/presale/assets:/usr/share/nginx/html/assets/assets`

---

## Dockerfile Changes (dockerfile_prod)

Cleanup only — no structural changes:

- `debian:latest` → `debian:bookworm-slim` (deterministic base image)
- Remove `RUN flutter doctor -v` (slow, unnecessary in automated builds)
- Remove `VOLUME` declaration (volume is managed at `docker run` time, not build time)

---

## Error Handling

- All steps in build scripts exit immediately on failure with a descriptive `[ERROR]` message
- VPS script validates all args upfront before taking any action
- Old container stop/remove failures are non-fatal (container may already be stopped)

---

## Not In Scope

- Multi-arch builds (fixed to `linux/amd64` via `DOCKER_DEFAULT_PLATFORM`)
- Automatic VPS SSH after upload (user initiates `deploy_vps.sh` manually)
- Rollback mechanism
- Dev environment build (covered by existing `dockerfile_dev`)
