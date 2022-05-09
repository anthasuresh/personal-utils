#!/usr/bin/bash

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
echo -e "\nsudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo -e "\ncurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -\n"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo -e "\nsudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'\n"
sudo apt-get update -y
echo -e "\nsudo apt-get update -y\n"
echo -e "$(sudo apt-get install -y docker-ce)"
echo -e "\nsudo apt-get install -y docker-ce\n\n\t\t===> \033[01;32mtype exit\033[0m <=="
echo "$(sudo usermod -aG docker $USER && newgrp docker)"
echo -e "\nsudo usermod -aG docker $USER && newgrp docker\n"
git clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git
echo -e "\ngit clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git\n"
cd ubuntu-wsl2-systemd-script/
echo -e "\ncd ubuntu-wsl2-systemd-script/\n"
bash ubuntu-wsl2-systemd-script.sh
echo -e "\nbash ubuntu-wsl2-systemd-script.sh\n"

echo -e "\n\nPlease follow the below steps.  \n\t👉 Windows-Key --> services \n\t👉 Restart \033[01;32mLxssManager\033[0m service \n\t👉 Continue with \033[01;32minstall-minikube-2.sh\033[0m "








