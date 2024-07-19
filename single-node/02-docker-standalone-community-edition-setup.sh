#!/bin/bash

apt-get -y remove docker docker-engine docker.io containerd runc podman-docker docker-doc docker-compose 1>/dev/null 2>/dev/null
mkdir -m 0755 -p /etc/apt/keyrings
/bin/rm /etc/apt/keyrings/docker.gpg 2>/dev/null
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch="amd64" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable"  >  /etc/apt/sources.list.d/docker.list

apt-get update

apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## test sample container
#docker pull hello-world
#docker run --name hello-world hello-world
