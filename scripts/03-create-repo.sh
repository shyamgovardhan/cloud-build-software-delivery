#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

# Create an Artifact Repository
gcloud artifacts repositories create "${PROJECT_ID}-repo" --location=$REGION  --repository-format=docker
