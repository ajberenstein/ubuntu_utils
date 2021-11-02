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
