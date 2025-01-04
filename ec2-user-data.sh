#!/bin/bash

# Ensure it is a public instance with a SG with SSH and HTTP(S)

# Update system packages
sudo yum update -y
sudo dnf update -y
sudo dnf install -y libicu 

# Variables (replace with your values)
ADO_URL="https://dev.azure.com/<your organization here>"
ADO_PAT="<your ADO Token here>"
POOL_NAME="<ADO agent pool name here>"
AGENT_NAME="EC2-Agent-$(hostname)" # You can optionally change this but I would leave it alone as it will always be unique

# Example Config
# ADO_URL="https://dev.azure.com/sandbox-test-123456"
# ADO_PAT="1234567890ABCDEFGHIJKLMNOXYZ1234567890"
# POOL_NAME="ec2_pool"


# Grab agent tarball
mkdir myagent && cd myagent
curl -O https://vstsagentpackage.azureedge.net/agent/3.248.0/vsts-agent-linux-x64-3.248.0.tar.gz
tar zxvf ./vsts-agent-linux-x64-3.248.0.tar.gz

# Configure the agent
./config.sh --unattended \
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