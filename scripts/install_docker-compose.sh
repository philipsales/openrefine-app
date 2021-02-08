#!/bin/bash

## Tested on 
# Ubuntu            | 18.04    |
# docker            | 15.1.0   |
# docker-compose    | 1.23.2   |

#Install the latest version of Docker CE  
sudo apt-get install -y docker-ce

##Install docker-compose - check latest
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

#Change permission
sudo chmod +x /usr/local/bin/docker-compose