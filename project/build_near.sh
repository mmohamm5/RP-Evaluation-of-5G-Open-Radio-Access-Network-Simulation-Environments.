#!/bin/bash

OLD_VERSION="0ubuntu1~20.04.1"
NEW_VERSION="0ubuntu1~20.04.2"

# Check if running on Ubuntu 20.04
if lsb_release -d | grep -q "Ubuntu 20.04"; then
  echo "Running on Ubuntu 20.04, continuing script..."
else
  echo "This script is recommended for Ubuntu 20.04 only."
  exit 1
fi

# Check if running as root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root."
  exit 1
else
  echo "Running as root, continuing script..."
fi

# Installation of Near-RTRICs

# if we use a snapshot we need to set hwclock again 
sudo apt update
sudo hwclock --hctosys 

# Starting the installation as per https://wiki.o-ran-sc.org/download/attachments/57378077/demo_g_release.txt?api=v2
git clone https://gerrit.o-ran-sc.org/r/ric-plt/ric-dep
cd ric-dep/bin
sed -i "s/${OLD_VERSION}/${NEW_VERSION}/g" install_k8s_and_helm.sh
sudo ./install_k8s_and_helm.sh
mkdir /etc/sysconfig
#sed -i 's|ExecStart=.*|& --registry-mirror=http://yourmirror:5000|' /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker
sudo ./install_common_templates_to_helm.sh
while read -r line; do docker pull $line; done < versions.txt
sed -i "s|ricip: \"10.0.0.1\"|ricip: \"$(ip addr show $(ls /sys/class/net | grep ^e) | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)\"|; s|auxip: \"10.0.0.1\"|auxip: \"$(ip addr show $(ls 
/sys/class/net | grep ^e) | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)\"|" ../RECIPE_EXAMPLE/example_recipe_oran_g_release.yaml

# fixing .kube/config
mkdir -p $HOME/.kube
sudo yes | sudo cp -rf -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


#Installing the RIC
sudo ./install -f ../RECIPE_EXAMPLE/example_recipe_oran_g_release.yaml
