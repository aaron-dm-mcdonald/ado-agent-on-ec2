# Overview for ADO Agent on EC2 Startup Script

## Example Config

These **must** be changed
ADO_URL="https://dev.azure.com/sandbox-12345"
ADO_PAT="1234567890ABCDEFGHIJKLMNOXYZ1234567890"
POOL_NAME="ec2_pool"

# EC2 Instance Requirements

1) Use Amazon Linux 2023
2) No SSH key is needed, we will just use Instance Connect
3) Security Group needs port 22, port 80, and port 443 (SSH, HTTP/S)
4) Copy the script after editing config variables into user data form

