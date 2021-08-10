sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install docker.io pass gnupg2 docker-compose tmux -y 
sudo usermod -aG docker $USER 
# change default shell to bash 
sudo chsh -s $(which bash) $USER 

# change docker log size
echo '{"log-opts":{"max-size":"500m","max-file":"5","compress":"true"}}' |sudo tee  /etc/docker/daemon.json
echo 'mark docker service not auto-upgrade'
sudo apt-mark hold docker docker.io
