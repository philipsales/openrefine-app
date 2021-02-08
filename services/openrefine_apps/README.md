# Deployment Instructions for OPENREFINE #

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

1. SSH to the OpenRefine droplet or server
    ```
    ssh root@<openrefine-server_PublicIPAddress>
    ```

1. Install firewall and cockpit 
    ```
    $ sudo apt update
    $ sudo apt -y install cockpit
    $ sudo systemctl start cockpit.socket
    $ sudo systemctl enable cockpit.socket
    ```

1. Access Cockpit web console
    ```
    https://public-ip-address-of-ubuntu-server:9090
    ```

## Installation of Java runtime and OpenRefine ##

1. Download java installer 
    ```
    $ sudo su - 
    $ sudo apt install -y default-jre
    ```

1. Create User for **all nodes**
    ```
    $ sudo adduser openrefine 
    $ usermod -aG sudo openrefine 
    ```
    **Note: OpenRefine user is sudoer*
    **Note: User password is op3nr3fin3@2020*

1. Download archived OpenRefine installer 
    ```
    $ sudo su - OpenRefine
    $ cd /home/OpenRefine
    $ wget https://github.com/openrefine/openrefine/releases/download/3.3/openrefine-linux-3.3.tar.gz
    $ wget https://github.com/OpenRefine/OpenRefine/releases/download/3.0/openrefine-linux-3.0.tar.gz

    $ tar -zxvf openrefine-linux-3.3.tar.gz 
    $ mv openrefine-linux-3.3.tar.gz/ openrefine-server-3.3
    $ rm openRefine-linux-3.3.tar.gz 
    ```

1. Run OpenRefine as background daemon and allot 3Gb as RAM capacity
    ```
    $ nohup ./openrefine-server-3.3/refine -m 3500M -i localhost & 
    ```

1. Download OpenRefine client 
    ```
    $ wget https://github.com/opencultureconsulting/openrefine-client/releases/download/v0.3.8/openrefine-client_0-3-8_linux
    $ mv openrefine-client_0-3-8_linux/ openrefine-client-0.3.8
    $ sudo chmod u+x openrefine-client-0.3.8 
    ```

1. Set Google Cloud auth credentials manually
    ```
    cd root_project
    #OPENREFINE
    export GOOGLE_APPLICATION_CREDENTIALS="/Users/ghost/src/github/medcheck.projects/openrefine/secrets/dev-medchek-pipeline-9390dbeea154.json" 
    gcloud auth activate-service-account --key-file=secrets/dev-medchek-pipeline-9390dbeea154.json 
    ```