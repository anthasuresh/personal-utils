#!/usr/bin/bash
#Install Conntrack
sudo apt install -y conntrack

#Install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x ./minikube
sudo mv ./minikube /usr/local/bin/
minikube config set driver docker

#Install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/
minikube delete
minikube start
echo "$(kubectl config use-context minikube)"

#Install HELM
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh 
chmod 700 get_helm.sh 
./get_helm.sh

rm -rf ubuntu-wsl2-systemd-script
rm get_helm.sh 
echo -e "\n\nOpen a new terminal\n\t👉 type \033[01;32mminikube / kubectl\033[0m\n\n"



















