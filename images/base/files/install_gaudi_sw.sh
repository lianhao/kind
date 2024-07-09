#!/bin/bash

set -o errexit

curl -X GET https://vault.habana.ai/artifactory/api/gpg/key/public | apt-key add --
OS_RELEASE=`lsb_release -c | awk '{print $2}'`
echo "deb https://vault.habana.ai/artifactory/debian ${OS_RELEASE} main" | tee /etc/apt/sources.list.d/gaudi.list
apt-get update && dpkg --configure -a
clean-install habanalabs-firmware-tools
