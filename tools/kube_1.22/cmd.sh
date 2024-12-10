sudo apt update
sudo apt install socat conntrack ebtables ipset curl openssl -y
curl -L https://github.com/kubesphere/kubekey/releases/download/v1.2.0-alpha.4/kubekey-v1.2.0-alpha.4-linux-amd64.tar.gz > installer.tar.gz && tar -zxf installer.tar.gz
chmod +x kk
sudo su -
cd /home/vagrant
./kk create cluster --with-kubernetes v1.22.1 --container-manager containerd 

exit
nano config.yml
kubeadm config migrate --old-config config.yml --new-config config-v1beta3.yml
cat config.yml