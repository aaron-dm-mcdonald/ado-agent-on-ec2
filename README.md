# Overview for ADO Agent on EC2 Startup Script

This script automates the setup of a self-hosted Azure DevOps (ADO) agent on an EC2 instance running Amazon Linux 2023. It ensures the instance is properly configured, downloads the necessary ADO agent package, and registers the agent with your ADO organization. Once configured, the agent is installed as a service and starts automatically. This setup allows for seamless integration with ADO pipelines by utilizing a scalable and customizable EC2-based agent.

## Table of Contents

1. [Overview](#overview-for-ado-agent-on-ec2-startup-script)
2. [Example Config](#example-config)
3. [EC2 Instance Requirements](#ec2-instance-requirements)
4. [Script Details](#script-details)


## Example Config

You must have a

These **must** be changed:

- ADO_URL="https://dev.azure.com/sandbox-12345"
- ADO_PAT="1234567890ABCDEFGHIJKLMNOXYZ1234567890"
- POOL_NAME="ec2_pool"

## EC2 Instance Requirements

1. Use Amazon Linux 2023
2. No SSH key is needed, we will just use Instance Connect
3. Security Group needs port 22, port 80, and port 443 (SSH, HTTP/S)
4. Copy the script after editing config variables into user data form

## Script Details

The script performs the following steps:

1. **Update and Install System Packages**:
   - Ensures the system is up-to-date by running `yum` and `dnf` update commands.
   - Install some .NET dependencies with dnf.
2. **Set Enviromental Variables**:
   Prompts you to configure essential variables like `ADO_URL`, `ADO_PAT`, and `POOL_NAME`.
4. **Download and Extract ADO Agent**:
   Fetches the latest version of the ADO agent and extracts it into a dedicated directory.
5. **Agent Configuration**:
   Registers the agent with ADO using the provided URL, PAT, and pool name.
6. **Service Installation**:
   Installs the ADO agent as a service and starts it automatically.