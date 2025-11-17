#!/bin/zsh

export DOCKER_DEFAULT_PLATFORM=linux/amd64
fvm flutter clean
fvm dart run build_runner build -d
clean
docker build -t presale:$1 .
docker save -o presale_v$1.tar presale:$1
scp -i ~/.ssh/217.18.62.204  presale_v$1.tar root@217.18.62.204:/home/presale_v$1.tar
ssh -i ~/.ssh/217.18.62.204  root@217.18.62.204
rm presale_v$1.tar