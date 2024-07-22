#!/bin/bash


kubectl taint nodes --all node-role.kubernetes.io/control-plane-

# get token
#kubeadm token list

## if yuou got output means ready
kubectl get nodes -o wide
