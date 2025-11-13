#!/bin/bash

echo "Building base docker image"
docker build -t plain-k3s:base .

echo "Running the container"
docker network create xlayer-network --subnet 192.168.213.0/24
docker run --name xlayer-container -d --network xlayer-network --ip 192.168.213.10 --privileged -p 80:80 -p 443:443 -p 6443:6443 plain-k3s:base

echo "Waiting for the container to boot (15 seconds)"
sleep 15

echo "Downloading the kubeconfig"
docker exec -it xlayer-container cat /etc/rancher/k3s/k3s.yaml > kubeconfig

echo "If you are using windows: run the add_entries_to_hosts_file.ps1 as administrator!!!"
echo "If you are using linux: append the file extra_hosts_file_entries.txt to your /etc/hosts file"
echo ""
echo "Then install XLayer using the installer"
echo ""
echo "Finally run the patch_pods.sh script"

