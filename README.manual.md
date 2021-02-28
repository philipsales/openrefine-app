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
    $ wget https://github.com/OpenRefine/OpenRefine/releases/download/3.0/openrefine-linux-3.0.tar.gz

    $ tar -zxvf openrefine-linux-3.0.tar.gz 
    $ mv openrefine-linux-3.0.tar.gz/ openrefine-server-3.0
    $ rm openRefine-linux-3.0.tar.gz 
    ```

1. Run OpenRefine as background daemon and allot 3Gb as RAM capacity
    ```
    $ nohup ./openrefine-server-3.3/refine -m 3500M -i 0.0.0.0 &
    $ nohup ./openrefine-server-3.3/refine -m 3500M -i 0.0.0.0 & 
    $ nohup ./openrefine-server-3.3/refine -m 3500M -i localhost & 
    ```

1. Download OpenRefine client 
    ```
    $ wget https://github.com/opencultureconsulting/openrefine-client/releases/download/v0.3.8/openrefine-client_0-3-8_linux
    $ mv openrefine-client_0-3-8_linux/ openrefine-client-0.3.8
    $ sudo chmod u+x openrefine-client-0.3.8 
    ```



## Installation of Google Cloud SDK ##

1. Use openrefine user
    ```
    sudo su - openrefine
    ```

1. Download Cloud SDK
    ```
    $ wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-288.0.0-linux-x86_64.tar.gz 
    $ tar -xzvf ..
    $ rm google-cloud-sdk-288.0.0-linux-x86_64.tar.gz  
    $ cd /home/openrefine/
    ```

Use the install script to add Cloud SDK tools to your path.
    ```
    $ cd /home/openrefine/
    $ ./google-cloud-sdk/install.sh
    $ ->error- ./google-cloud-sdk/bin/gcloud init 
    $ gcloud init --console-only
    $ gcloud config set accessibility/screen_reader true
    ```

1. Configure Google Cloud Console in website platform
    Enable Google Cloud API
    Enable Cloud Resource Manager API
    Generate IAM user for openrefine (i.e. dev-openrefine-api@dev-medchek-pipeline.iam.gserviceaccount.com)
    - Download the key-file

1. Set Google Cloud auth credentials using scripts 
    ```
    $ cd script
    $ source ./scripts/set_google_cloud_auth.sh
    ```

## Installation of OpenRefine API service ##
1. Use openrefine user
    ```
    sudo su - openrefine
    ```

1. Install Python 
    ```
    $ sudo apt update
    $ sudo apt install python3-pip
    ```

1. Install Pyenv 
    ```
    $ curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    $ exec "$SHELL"
    ```

1. Install Pyenv as source in .bashrc
    ```
    $ vi ~/.bashrc
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    $ source ~/.bashrc
    ```

1. Install Python dependencies and specific version 
    ```
    $ sudo apt-get install build-essential git libreadline-dev zlib1g-dev libssl-dev libbz2-dev libsqlite3-dev
    $ pyenv install 3.6.2
    $ pyenv global 3.6.2                 
    $ pyenv virtualenv  openrefine-python3.6_env
    ```

## Run the of OpenRefine API service ##
1. Activate virtual enviroment 
    ```
    $ pyenv activate  openrefine-python3.6_env
    ```

1. Install dependencies
    ```
    $ cd /home/openrefine/openrefine-api
    $ pip install -r requirements.txt
    ```

1. Run the API manually 
    ```
    $ cd /home/openrefine/openrefine-api
    $ python -B src/app.py
    ```


1. Open browser
    ```
    http://0.0.0.0:5000/api/ui/
    ```
