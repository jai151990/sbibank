#!/bin/bash
cp target/sbibank.war /home/shankar/Desktop/Git/sbibank/cookbooks/nginx/files
#docker build -t="jaisriram111/sbi-img" .
docker run -it -d --name sbi jaisriram111/sbi-img /bin/bash
docker start sbi

