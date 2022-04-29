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
echo -e "\nsudo apt-get install -y docker-ce\n\n\t\t===> type exit <=="
echo "$(sudo usermod -aG docker $USER && newgrp docker)"
echo -e "\nsudo usermod -aG docker $USER && newgrp docker\n"
git clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git
echo -e "\ngit clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git\n"
cd ubuntu-wsl2-systemd-script/
echo -e "\ncd ubuntu-wsl2-systemd-script/\n"
bash ubuntu-wsl2-systemd-script.sh
echo -e "\nbash ubuntu-wsl2-systemd-script.sh\n"

echo -e "Restart the LxssManager in Windows to initialize systemctl with WSL\n\t\tWindows-Key --> services \n\n\t\tThen continue with curl install-minikube-2.sh "











