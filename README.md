# Overview for ADO Agent on EC2 Startup Script

This script automates the setup of a self-hosted Azure DevOps (ADO) agent on an EC2 instance running Amazon Linux 2023. It ensures the instance is properly configured, downloads the necessary ADO agent package, and registers the agent with your ADO organization. Once configured, the agent is installed as a service and starts automatically (for example, on system restart).

## Table of Contents

1. [Overview](#overview-for-ado-agent-on-ec2-startup-script)
2. [Example Config](#example-config)
3. [EC2 Instance Requirements](#ec2-instance-requirements)

## Example Config

These **must** be changed:

- ADO_URL="https://dev.azure.com/sandbox-12345"
- ADO_PAT="1234567890ABCDEFGHIJKLMNOXYZ1234567890"
- POOL_NAME="ec2_pool"

## EC2 Instance Requirements

1. Use Amazon Linux 2023
2. No SSH key is needed, we will just use Instance Connect
3. Security Group needs port 22, port 80, and port 443 (SSH, HTTP/S)
4. Copy the script after editing config variables into user data form
