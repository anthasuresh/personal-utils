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
