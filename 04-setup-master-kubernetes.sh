#!/bin/bash

podnetwork="10.11.0.0/16"


sed -i "s#10.85.0.0/16#$podnetwork#g" /etc/cni//net.d/11-crio-ipv4-bridge.conflist 

export KUBECONFIG=/etc/kubernetes/admin.conf

useradd ks8adminuser
chsh -s /bin/bash ks8adminuser

# These address ranges are examples


kubeadm init --pod-network-cidr $podnetwork

#sleep for init to finish
sleep 10
mkdir -p /home/ks8adminuser/.kube
/bin/cp -pRv /etc/kubernetes/admin.conf /home/ks8adminuser/.kube/config
chown -R ks8adminuser:ks8adminuser /home/ks8adminuser/.kube

su -c 'kubectl get nodes' ks8adminuser
kubectl get nodes

kubectl create -f files/calico-network/tigera-operator.yaml
/bin/cp files/calico-network/custom-resources.yaml /tmp/custom-resources.yaml
sed -i "s#10.244.0.0/16#$podnetwork#g" /tmp/custom-resources.yaml
kubectl create -f /tmp/custom-resources.yaml

## show CALICO System
kubectl get pods -n calico-system
## show KUBE System
kubectl get pods -n kube-system


