#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

# Configure credentials
gcloud init && git config --global credential.https://source.developers.google.com.helper gcloud.sh

# Add your new repo as a remote repo called google
git remote add google https://source.developers.google.com/p/${PROJECT_ID}/r/${CSR_NAME}
