#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

# Allow the Cloud Build Service Account to run scans
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
--member=serviceAccount:${SERVICE_ACCOUNT} \
--role=roles/ondemandscanning.admin 

# Allow the Cloud Build Service Account to deploy to GKE
gcloud projects add-iam-policy-binding ${PROJECT_ID}  \
--member=serviceAccount:${SERVICE_ACCOUNT} \
--role=roles/container.developer

# Allow Cloud Build Service Account the permission to attest
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
--member=serviceAccount:${SERVICE_ACCOUNT} \
--role=roles/containeranalysis.notes.attacher