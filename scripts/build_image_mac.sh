#!/bin/zsh

docker build -t presale_v$1 .
docker run -d -p 5566:80 --name presale_v$1_cont presale_v$1