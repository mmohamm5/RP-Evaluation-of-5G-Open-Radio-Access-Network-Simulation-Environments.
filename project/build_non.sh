#!/bin/bash

#please execute "sudo -i" before running the installer

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

timestamp=$(date +%s)

# if we use a snapshot we need to set hwclock 
sudo apt update
sudo hwclock --hctosys 

# Cloning the repo
cd /root/
git clone --recursive "https://gerrit.o-ran-sc.org/r/it/dep"

# Setting up reqs
./dep/smo-install/scripts/layer-0/0-setup-microk8s.sh
./dep/smo-install/scripts/layer-0/0-setup-charts-museum.sh
./dep/smo-install/scripts/layer-0/0-setup-helm3.sh

helm plugin install https://github.com/chartmuseum/helm-push

# Building charts
./dep/smo-install/scripts/layer-1/1-build-all-charts.sh

# Install O-RAN
#./dep/smo-install/scripts/layer-2/2-install-oran.sh

#./dep/smo-install/scripts/sub-scripts/install-onap.sh ./dep/smo-install/helm-override/default/onap-override.yaml $timestamp

cd ./dep/smo-install/scripts/packages
helm cm-push strimzi-kafka-operator-helm-3-chart-0.28.0.tgz local
helm repo update
helm install strimzi-kafka-operator local/strimzi-kafka-operator \
--namespace strimzi-system \
--version 0.28.0 \
--set watchAnyNamespace=true \
--create-namespace

