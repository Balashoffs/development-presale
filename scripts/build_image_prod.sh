#!/bin/zsh

export DOCKER_DEFAULT_PLATFORM=linux/amd64
fvm flutter clean
fvm dart run build_runner build -d
clean
docker build -f ./scripts/dockerfile_prod -t presale_prod:$1 .
docker save -o ./scripts/presale_prod_v$1.tar presale_prod:$1
scp -i ~/.ssh/217.18.62.204  ./scripts/presale_prod_v$1.tar root@217.18.62.204:/home/presale/presale_prod_v$1.tar
ssh -i ~/.ssh/217.18.62.204  root@217.18.62.204
rm ./scripts/presale_prod_v$1.tar