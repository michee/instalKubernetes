
# set hostnames TODO
sudo echo 'node01' > /etc/hostname
# node01 > /etc/hosts

# automount usb to /media/ssd
sudo echo 'UUID=0b116480-81c3-4836-aff1-7291f9b7dec6 /media/ssd ext4 defaults,nofail 0 0 ' > /etc/fstab

# enalbe NFS
sudo apt-get install nfs-kernel-server
sudo apt-get install portmap 

sudo echo '/media/ssd *(rw,sync,no_subtree_check)' >> /etc/exports

sudo exportfs -ra
sudo systemctl restart nfs-kernel-server


# generate git key
ssh-keygen -t rsa -b 4096 -C "michee@kth.se"
cat ~/.ssh/id_rsa.pub


# get the scripts
cd ~
git clone git@github.com:michee/instalKubernetes.git
cd installKubernetes


