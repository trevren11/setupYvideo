#!/bin/bash

echo "1. Making Directories..."
cd ~
mkdir -p Docker/ && cd Docker

echo
echo "2. Cloning Dependencies..."
git clone https://github.com/dro248/ayamelDBDockerfile
git clone https://github.com/dro248/AyamelDockerfile
git clone https://github.com/dro248/runAyamel

echo
echo "3. Getting secret..."

echo $TEST_CRED

sudo apt-get install sshpass
sshpass -p $APPLICATION_CREDENTIALS scp arclite@sartre4.byu.edu:~/application.conf ./AyamelDockerfile

echo
echo "4. Making space for database..."
sudo service mysql stop

echo
echo "5. Creating Database & App..."
cd runAyamel
sudo docker-compose up
