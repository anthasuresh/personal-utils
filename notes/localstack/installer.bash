sudo apt install python3-pip -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
docker --version
docker compose --version
sudo update-alternatives --config iptables
sudo systemctl status docker
pip install localstack
pip install awscli
pip install awscli-local



------------------v2 ------------------


sudo apt update -y && sudo apt upgrade -y && sudo apt install python3-pip -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
. $HOME/.nvm/nvm.sh
nvm install --lts
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh && sudo usermod -aG docker $USER
docker --version && docker compose version
sudo update-alternatives --config iptables
sudo systemctl status docker
pip install localstack && pip install awscli && pip install awscli-local
export PATH=$PATH:/home/k8s/.local/bin

#New Terminal 
localstack start -d
localstack stop
sudo docker pull localstack/localstack
git clone https://github.com/localstack/localstack-demo.git
localstack start -d && cd ~/localstack-demo/ && make deploy
