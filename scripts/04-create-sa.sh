#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

# gcloud iam service-accounts create ${SERVICE_ACCOUNT} -- display-name=${SERVICE_ACCOUNT} --project=${PROJECT_ID}