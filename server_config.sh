#################################
# Docker install 
#################################
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world  #veryf installation
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
docker run hello-world 


#################################
# Miniconda
#################################


#################################
# Rstudio server 
#################################
sudo apt-get install r-base
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2021.09.0-351-amd64.deb
sudo gdebi rstudio-server-2021.09.0-351-amd64.deb
sudo rstudio-server verify-installation # verify instalation
# custom launcher with advanced version managment (and istallation)
wget https://github.com/ajberenstein/ubuntu_utils/blob/main/launch_rstudio_server.sh
sudo chmod +x launch_rstudio_server.sh
sudo mv launch_rstudio_server.sh /usr/bin/


