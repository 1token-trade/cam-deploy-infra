sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install docker.io pass gnupg2 docker-compose tmux python3 python3-pip -y 
sudo usermod -aG docker $USER 
# change default shell to bash 
sudo chsh -s $(which bash) $USER 

# install and config chrony service for AWS
if [ ! -f /etc/chrony/chrony.conf ]; then
    echo 'install chrony'
    sudo apt install chrony -y
    sudo cp /etc/chrony/chrony.conf /etc/chrony/chrony.conf.bak
    sudo sed -i '16a server 169.254.169.123 prefer iburst minpoll 4 maxpoll 4' /etc/chrony/chrony.conf
    sudo /etc/init.d/chrony restart
    chronyc tracking
fi
# change docker log size
echo '{"log-opts":{"max-size":"500m","max-file":"5","compress":"true"}}' |sudo tee  /etc/docker/daemon.json
echo 'mark docker service not auto-upgrade'
sudo apt-mark hold docker docker.io
