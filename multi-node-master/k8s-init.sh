

#https://kubernetes.io/docs/concepts/services-networking/dual-stack/
#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/dual-stack-support/
#Note:
#The --apiserver-advertise-address flag does not support dual-stack.

# These address ranges are examples
#kubeadm init --pod-network-cidr=10.244.0.0/16,2001:db8:42:0::/56 --service-cidr=10.96.0.0/16,2001:db8:42:1::/112
#kubeadm init --pod-network-cidr=10.244.0.0/16 --service-cidr=10.96.0.0/16

kubeadm init --pod-network-cidr=10.244.0.0/16 

