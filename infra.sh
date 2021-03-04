sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install docker.io pass gnupg2 docker-compose tmux -y 
sudo usermod -aG docker $USER 
# change default shell to bash 
sudo chsh -s $(which bash) $USER 
