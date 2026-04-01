#!/bin/zsh
# Usage: ./build_image_prod.sh <version> <dart-define-json-path> <launcher-icons-yaml-path>
# Example: ./build_image_prod.sh 1.0.0 .env/.prod.json .consumer_env/flutter_launcher_icons.yaml

export DOCKER_DEFAULT_PLATFORM=linux/amd64
fvm flutter clean
fvm dart run build_runner build -d

DART_DEFINE_B64=$(base64 -w0 < $2)
LAUNCHER_ICONS_B64=$(base64 -w0 < $3)

docker build -f ./scripts/dockerfile_prod \
  --build-arg DART_DEFINE_FILE_CONTENT="$DART_DEFINE_B64" \
  --build-arg LAUNCHER_ICONS_CONTENT="$LAUNCHER_ICONS_B64" \
  -t presale_prod:$1 .
docker save -o ./scripts/presale_prod_v$1.tar presale_prod:$1
scp -i ~/.ssh/217.18.62.204  ./scripts/presale_prod_v$1.tar root@217.18.62.204:/home/presale/presale_prod_v$1.tar
ssh -i ~/.ssh/217.18.62.204  root@217.18.62.204
rm ./scripts/presale_prod_v$1.tar