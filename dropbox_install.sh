################################
## Dropbox
################################
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /home/$USER/dropbox.py
chmod +x /home/$USER/dropbox.py
sudo mv /home/$USER/dropbox.py /usr/bin/
