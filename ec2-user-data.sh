#!/bin/bash

# Update system packages
sudo yum update -y
sudo dnf update -y
sudo dnf install -y libicu

exec > /var/log/user-data.log 2>&1

# Ensure we are in home directory 
cd /home/ec2-user

# Variables (replace with your values)
export ADO_URL="https://dev.azure.com/sandbox-test-1323634"
export ADO_PAT="8Uxno3HFAQA4jswmnuXzaDpXwVMZRvf25zU0umTnCJ5CE7hSI8lXJQQJ99BAACAAAAAAAAAAAAAGAZDOAJUN"
export POOL_NAME="ec2-pool"
export AGENT_NAME="EC2-Agent-$(hostname)" # You can optionally change this but I would leave it alone as it will always be unique

# Grab agent tarball
mkdir -p myagent && cd myagent
curl -O https://vstsagentpackage.azureedge.net/agent/3.248.0/vsts-agent-linux-x64-3.248.0.tar.gz
tar zxvf ./vsts-agent-linux-x64-3.248.0.tar.gz

# Configure the agent
sudo -u ec2-user ./config.sh --unattended \
  --url "$ADO_URL" \
  --auth pat \
  --token "$ADO_PAT" \
  --pool "$POOL_NAME" \
  --agent "$AGENT_NAME" \
  --acceptTeeEula \
  --replace

# Install and start as a service
sudo ./svc.sh install
sudo ./svc.sh start