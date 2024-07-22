#!/bin/bash


## various Network and other Addon
##https://kubernetes.io/docs/concepts/cluster-administration/addons/

export KUBECONFIG=/etc/kubernetes/admin.conf


#kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/tigera-operator.yaml
#kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/custom-resources.yaml

kubectl create -f files/calico-network/tigera-operator.yaml 
kubectl create -f files/calico-network/custom-resources.yaml

cd /tmp/
curl -L https://github.com/projectcalico/calico/releases/download/v3.28.0/calicoctl-linux-amd64 -o kubectl-calico
chmod +x kubectl-calico
kubectl calico -h

cd - 

