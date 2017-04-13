#!/bin/bash

echo "1. Making Directories..."
pwd
ls -al
cd ~
mkdir -p Docker/ && cd Docker

echo
echo "2. Cloning Dependencies..."
git clone https://github.com/trevren11/ayamelDBDockerfile
git clone https://github.com/dro248/AyamelDockerfile
git clone https://github.com/dro248/runAyamel

echo
echo "3. Getting secret..."

mv /home/travis/build/BYU-ODH/Ayamel/conf/application.conf ./AyamelDockerfile
echo "Current Directory"
pwd
ls -al 
echo "Up one Directory"
ls ../ -al 

echo
echo "4. Making space for database..."
sudo service mysql stop

echo
echo "5. Creating Database & App..."
cd runAyamel
sudo docker-compose up
