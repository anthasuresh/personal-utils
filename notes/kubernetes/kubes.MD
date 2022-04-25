# Install Packages
1. Log into the Control Plane Node (Note: The following steps must be performed on all three nodes.
1. Create configuration file for containerd:
```bash
cat <<EOF sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
```
3. Load modules:
>sudo odprobe overlay<br>
>sudo modprobe br_netfilter
4. Set system configurations for Kubernetes networking:
```bash
cat <<EOF | sudo tee /etc/sysct1.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
```
5. Apply new settings:<br>
`sudo sysctl --system`
6. Install containerd:<br>
`sudo apt-get update && sudo apt-get install -y containerd`
7. Cresta default configuration file for containerd:<br>
`sudo mkdir -p /etc/containerd`
8. Generate default containerd configuration and save to the newly created default file:<br>
`sudo containerd config default | sudo tee /etc/containerd/config.toml`
9. Restart containerd to ensure now configuration file usage:<br>
`sudo systemctl restart containerd`
1. Verify that containerd is running.<br>
`sudo systemctl status containerd`


------

KB.MD ClUsers\utzb\Downloads\Cubes\K8.MDB # Install Packages
1 11
sudo sysctl --system
6. Install containerd: <br>
sudo apt-get update && sudo apt-get install -y containerd
7. Create default configuration file for containerd:<br>
"sudo mkdir -p /etc/containerd
8. Generate default containerd configuration and save to the newly created default file:<br>
sudo containerd config default sudo tee /etc/containerd/config.toml
9. Restart containers to ensure new configuration file usage:<br>
sudo systemctl restart containerd
1. Verify that containerd is running.<br>
sudo systemctl status containerd
1. Disable swap:<br>
sudo swapoff -a
1. Disable swap on startup in /etc/fstab:<br>
sudo sed -i '/ swap / s/^\(.*\)$/#\1/8' /etc/fstab
1. Install dependency packages:<br>
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
1. Download and add GPG key:<br>
'curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add-
1. Add Kubernetes to repository list:<br>
bash
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
16. Update package listings:<br>
sudo apt-get update
1. Insta11 Kubernetes packages
(Note: If you get a dpkg lock message, just wait a minute or two before trying the command again):
sudo apt-get install -y kubelet-1.23.0-e8 kubeadm=1.23.0-e8 kubectl=1.23.6-00
1. Turn off automatic updates:
sudo apt-mark hold kubelet kubeade kubects
Log into both Worker Modes to perform previous steps.
# Initialize the Cluster
1. Initialize the Kubernetes cluster on the control plane node using kubeadm (Note: This is only



_____

sudo apt-get install -y kubelet-1.23.0-08 kubeadm=1.23.0-60 kubectl=1.23.0-00
1. Turn off automatic updates:
sudo apt-mark hold kubelet kubeade kubect)
Log into both Worker Nodes to perform previous steps.
# Initialize the Cluster
1. Initialize the Kubernetes cluster on the control plane node using kubeadu (Note: This is only
performed on the Control Plane Node):
sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.23.0
1. Set kubect access:
bash
mkdir -p SHONE/.kube
sudo cp i /etc/kubernetes/admin.conf SHOME/.kube/config
sudo chow $(id -u):$(id -B) SHOME/.kube/config
1. Test access to cluster:<br>
kubectl get nodes
# Install the Calico Network Add-On
1. On the Control Plane Mode, install Calico Networking:<br>
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
2. Check status of the control plane node:<br>
kubectl get nodes
# Join the Worker Nodes to the Cluster
1. In the Control Plane Mode, create the token and copy the kubeadu join command (NOTE: The join
comand can also be found in the output from kubeada init command): <br>
kubeadm token create --print-join-command
1. In both Worker Modes, paste the kubeado join command to join the cluster. Use sudo to run it as
root:
sudo kubeadm join ...'
1. In the Control Plane Mode, view cluster status (Note: You may have to wait a few moments to
allow 11 nodes to become ready):
kubect get nodes


---



Ls -trl










-------------------------
Working with Kubernetes Using kubect]
1. Node Status : 'kubectl get nodes
1. POD list kubectl get pods --all-namespaces
1. Delete Pod : 'kubectl delete pod web-frontendº
1. Create a New Pod (via yml) :
"""yaml
apiVersion: v1
kind: Pod
metadata:
name: web-frontend
Spec:
containers:
- name: nginx
image: nginx
'''

1. Create a new pod: 'kubectl creste -f web-frontend.yml I

========
1. nginx-pod.ymi
"yami
apiVersion: vi
kind: Pod
metadata:
name: nginx
Spec:
containers:
• name: nginx
image: nginx
ports:
containerPort: 80
1. redis-pod.yml
yaml
apiVersion: v1
kind: Pod
metadata:
name: redis
spec:
containers:
- name: redis
image: redis
1. Create pod
>kubectl create -f nginx-pod.yml<br>
kubectl create of redis-pod.yml
1. Verify Pods are up and running:
kubectl get pods -o wide
1.Check if pod's communicable
curl <nginx IP address>
1.Check Nginx Container Logs
kubectl logs nginx
EEEEEE
kubeadm


 https://kubernetes.io/docs/
: https://github.com/kubernetes/
https://kubernetes.io/blog/ https://helm.sh/docs/

