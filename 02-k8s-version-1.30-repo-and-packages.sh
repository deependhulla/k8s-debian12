#!/bin/bash

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg


echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list
chmod 644 /etc/apt/sources.list.d/kubernetes.list   

apt-get update
apt-get install -y kubectl cri-tools kubeadm

## check and print version
kubectl version --client

# below command firs time would gert error
# The connection to the server <server-name:port> was refused - did you specify the right host or port?
#kubectl cluster-info dump

# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
# Enable kubectl autocompletion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
sudo chmod a+r /etc/bash_completion.d/kubectl
source ~/.bashrc

#Install kubectl convert plugin A plugin for Kubernetes command-line tool kubectl, which allows you to convert manifests between different API versions. This can be particularly helpful to migrate manifests to a non-deprecated api version with newer Kubernetes release. 

cd /opt
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert"
echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
kubectl convert --help
rm kubectl-convert kubectl-convert.sha256
cd -
