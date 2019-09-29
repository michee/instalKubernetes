#!/bin/sh

sudo kubeadm reset
sudo apt-get remove -y --purge kubeadm kubectl kubelet 

### DOCKER CLEANUP ###
docker rm -f $(docker ps -qa)
docker rmi -f $(docker images -q)
docker volume rm -f $(docker volume ls -q)

cleanupdirs="/var/lib/etcd /etc/kubernetes /etc/cni /opt/cni /var/lib/cni /var/run/calico /opt/rke"
for dir in $cleanupdirs; do
  echo "Removing $dir"
  sudo rm -rf $dir
done
### DOCKER END ######

sudo apt-get remove -y --purge docker-ce

DOCKER_V=18.06.1~ce~3-0~debian
KUBE_V=1.12.10-00 #testing

#KUBE_V=1.12.2-00

#DOCKER_V=17.12.1~ce-0~debian
#KUBE_V=1.11.4-00

sudo apt-get install -y --allow-downgrades docker-ce=$DOCKER_V
sudo apt-get install -y kubeadm=$KUBE_V kubectl=$KUBE_V kubelet=$KUBE_V

#install CNI plugins
# cd ~
# git clone https://github.com/containernetworking/plugins.git
# cd ~/plugins
# # ./build_linux.sh # to slow
# sudo mkdir -p /opt/cni/bin
# sudo cp ~/plugins/bin/* /opt/cni/bin/

#Help Flannel
#sudo sysctl net.bridge.bridge-nf-call-iptables=1
