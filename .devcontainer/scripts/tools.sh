#!/bin/bash
# install tools for container standup
echo "cwd: $(pwd)"
echo "---getting tools---"
sudo apt-get update
sudo apt-get install -y jq
echo "---installing terraform---"
terraformVersion="0.12.29"
sudo wget https://releases.hashicorp.com/terraform/$terraformVersion/terraform_"$terraformVersion"_linux_amd64.zip
sudo unzip ./terraform_"$terraformVersion"_linux_amd64.zip -d /usr/local/bin/
echo "---terraform done---"
echo "---installing gcloud---"
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update -y
sudo apt-get install -y google-cloud-sdk
echo "---gcloud done---"
echo "---tools done---"