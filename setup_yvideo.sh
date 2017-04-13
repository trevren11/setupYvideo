#!/bin/bash

echo "1. Making Directories..."
cd ~
mkdir -p Docker/ && cd Docker

echo
echo "2. Cloning Dependencies..."
git clone https://github.com/trevren11/ayamelDBDockerfile
git clone https://github.com/dro248/AyamelDockerfile
git clone https://github.com/dro248/runAyamel

echo
echo "3. Getting secret..."

mv BYU-ODH/Ayamel/conf/application.conf ./AyamelDockerfile
ls -al 

echo
echo "4. Making space for database..."
sudo service mysql stop

echo
echo "5. Creating Database & App..."
cd runAyamel
sudo docker-compose up
