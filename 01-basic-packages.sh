#!/bin/bash
#

apt update
## remove its create problem.
apt-get -y purge network-manager
systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
systemctl mask NetworkManager.service

apt -y  upgrade

## install basic postfix, chrony time-server tool instead of default and other useful tools

CFG_HOSTNAME_FQDN=`hostname -f`
echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
echo "postfix postfix/mailname string $CFG_HOSTNAME_FQDN" | debconf-set-selections
echo "iptables-persistent iptables-persistent/autosave_v4 boolean true" | debconf-set-selections
echo "iptables-persistent iptables-persistent/autosave_v6 boolean true" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive

apt -y  install vim chrony openssh-server screen net-tools git mc postfix sendemail tmux  \
	sudo wget curl ethtool iptraf-ng traceroute telnet rsyslog software-properties-common \
	dirmngr parted gdisk apt-transport-https lsb-release ca-certificates iputils-ping \
	bridge-utils iptables jq conntrack 
 
sed -i '/swap/s/^/#/' /etc/fstab
swapoff -a
modprobe br_netfilter
sysctl -w net.ipv4.ip_forward=1

echo ""
echo ""
echo "---------------------------------------------------------"
echo "Reboot to load kernel update if any and swapoff for k8s"
echo "---------------------------------------------------------"
echo ""
echo ""
