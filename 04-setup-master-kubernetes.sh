#!/bin/bash


export KUBECONFIG=/etc/kubernetes/admin.conf

useradd ks8adminuser
chsh -s /bin/bash ks8adminuser

# These address ranges are examples
#kubeadm init --pod-network-cidr=10.244.0.0/16,2001:db8:42:0::/56 --service-cidr=10.96.0.0/16,2001:db8:42:1::/112
#kubeadm init --pod-network-cidr=10.244.0.0/16 --service-cidr=10.96.0.0/16
#kubeadm init --pod-network-cidr=10.244.0.0/16
kubeadm init --pod-network-cidr=10.244.0.0/16
## for root user to user as admin too
#export KUBECONFIG=/etc/kubernetes/admin.conf

mkdir -p /home/ks8adminuser/.kube

/bin/cp -pRv /etc/kubernetes/admin.conf /home/ks8adminuser/.kube/config
chown -R ks8adminuser:ks8adminuser /home/ks8adminuser/.kube

su -c 'kubectl get nodes' ks8adminuser
kubectl get nodes


