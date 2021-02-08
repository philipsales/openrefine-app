# Manual Deployment Instructions for OPENREFINE #

## Hardware Server Requirements ##
1. Single vm for the master node 
    ```
    Standard / Shared CPU / 2vCPU / 16 GB Memory / 20 GB Disk / SGP1 - Ubuntu 18.04.3 (LTS) x64
    ```

## Operation System Requirements ##
1. Master and Data Nodes
    ```
    NAME="Ubuntu Linux"
    VERSION="18.04.3 (Core)"
    ID="debian"
    ID_LIKE="bionic beaver"
    VERSION_ID="18"
    PRETTY_NAME="Ubuntu LTS (Core)"
    ```
    
## Server Monitoring and Terminal GUI for each node ##

1. create user for **all nodes**
    ```
    $ sudo adduser openrefine 
    $ sudo usermod -aG sudo openrefine 
    ```
    **Note: OpenRefine user is sudoer*
    **Note: User password is op3nr3fin3@2020

1. Log out and log back to host machine

1. change to openrefine user
    ```
    sudo su openrefine
    ```
    
1. install git
    ```
    sudo apt update
    sudo apt-get install git
    sudo apt update
    ```

1. pull install from repository 
    ```
    git clone https://gitlab.medcheck.com.ph/data-engineer/openrefine-app.git
    ```

1. grant scripts permission 
    ```
    cd openrefine-app/scripts
    chmod u+x *.sh
    ```

1. install docker
    ```
    ./install_docker.sh
    ```

1. install docker-compose
    ```
    ./install_docker-compose.sh
    ```

1. create .htppasswd
    ```
    ./generate_htpasswd.sh
    ```

1. copy the password and user in the nginx/.htppasswd file
    e.g.
    ```
    philip:$apr1$feHyY8xI$aS39wI0/hlEGGiqFrHmhi.
    ```

1. run docker-compose
    ```
    sudo  docker-compose up -d
    ```