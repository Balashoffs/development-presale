@echo off
docker build -t presale:%1 .
docker save -o presale_v%1.tar presale:%1
scp -i %USERPROFILE%\.ssh\217.18.62.204  presale_v%1.tar root@217.18.62.204:/home/presale_v%1.tar
rm presale_v%1.tar