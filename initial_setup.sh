# This can be run the first time to install all of the dependencies
# Run with sudo

sudo apt-get install -y \
    linux-image-generic \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Add certs
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "$(tput setaf 3)Please verify this prints 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
sudo apt-key fingerprint 0EBFCD88

# Add repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Hack for serena ubuntu version, currently doesn't exist
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   xenial \
#   stable"

# Update repos and install docker
sudo apt-get update
sudo apt-get install docker-ce -y

# Install docker compose 
sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# remove Docker directories if they already exist
sudo rm -rf ~/Docker/ayamelDBDockerfile  
sudo rm -rf ~/AyamelDockerfile  
sudo rm -rf ~/runAyamel

# Finally ready to run setup 
sudo ./setup_yvideo.sh
