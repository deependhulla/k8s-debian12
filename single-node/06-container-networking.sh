
cd /tmp/
curl -LO https://github.com/containernetworking/plugins/releases/download/v1.5.1/cni-plugins-linux-amd64-v1.5.1.tgz

mkdir -p /opt/cni/bin

tar -xvzf  /tmp/cni-plugins-linux-amd64-v1.5.1.tgz -C /opt/cni/bin

