#!/bin/bash

# List of Linux target IPs
SERVER_LIST="linux_servers.txt"

# SSH credentials
SSH_USER="root"
SSH_PASS="S0uthPAssw0rd"

# Installer URL and install path
INSTALLER_URL="http://192.168.15.217/so-elastic-agent_linux_amd64"
INSTALL_DIR="/opt/Elastic"

# Loop through IP list
while read -r SERVER; do
    echo "Connecting to $SERVER..."

    sshpass -p "$SSH_PASS" ssh -o StrictHostKeyChecking=no $SSH_USER@$SERVER bash -c "'
        mkdir -p $INSTALL_DIR
        cd $INSTALL_DIR

        echo Downloading installer...
        curl -O $INSTALLER_URL

        echo Making installer executable...
        chmod +x so-elastic-agent_linux_amd64

        echo Running installer...
        ./so-elastic-agent_linux_amd64 install --non-interactive --force
    '"

    if [ $? -eq 0 ]; then
        echo "Installed successfully on $SERVER"
    else
        echo "Failed to install on $SERVER"
    fi

done < "$SERVER_LIST"
