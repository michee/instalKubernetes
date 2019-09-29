
#sudo ./reinstall.sh

sudo swapoff -a

sudo kubeadm config images pull

# CLEANUP TO PREVENT TLS handshake error in KUBE_API container during "kubeadm init"
#sudo kubeadm reset
#sudo ifconfig cni0 down && ip link delete cni0
#sudo ifconfig flannel.1 down && ip link delete flannel.1
#sudo rm -rf /var/lib/cni/


sudo kubeadm init 

# change timeout in /etc/kubernetes/manifests/kube-api.yaml
# Give more time for kube api to do TLS handshake

# copy kubeadm configs
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# install weave network
./installNetwork.sh

# install kubedashboard 
./installDashboard.sh
