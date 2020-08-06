#!/bin/bash
# install tools for container standup
echo "---getting tools---"
sudo apt-get update
sudo apt-get install jq
. gcloud.sh
. terraform.sh
echo "---tools done---"