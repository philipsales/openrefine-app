#!/bin/bash

## Tested on 
# Ubuntu            | 18.04    |
# docker            | 15.1.0   |
# docker-compose    | 1.23.2   |


#Installing Repsoitory 
sudo apt-get update -y

#Installing Packages 
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify fingerprints:
sudo apt-key fingerprint 0EBFCD88

#Use the following command to set up the stable repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update apt 
sudo apt-get update

#Install the latest version of Docker CE  
# sudo apt-get install docker-ce docker-ce-cli containerd.io 

#Install the latest version of Docker CE  
#For Google VM - https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket
sudo apt-get install -y docker-ce

#Start at system reboot
sudo systemctl start docker && sudo systemctl enable docker

#Add <user> to the docker group
sudo usermod -aG docker openrefine 
