# Manual Deployment Instructions for OPENREFINE #

## Hardware Server Requirements ##
1. Single droplet for the master node (DigitalOcean)
    ```
    Standard / Shared CPU / 1vCPU / 2 GB Memory / 50 GB Disk / SGP1 - Ubuntu 18.04.3 (LTS) x64
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

    arch: 3.10.0-1062.18.1.el7.x86_64
    cpu MHz:  2500.000 
    MemTotal: 1843112 kB (1.8GB RAM)
    ```
## Server Monitoring and Terminal GUI for each node ##

1. grant scripts permission 
    ```
    cd scripts
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
    docker-compose up -d
    ```