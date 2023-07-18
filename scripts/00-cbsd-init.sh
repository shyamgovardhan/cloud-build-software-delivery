#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

export PROJECT_ID="aiml-play"
export REGION="australia-southeast1"
export ZONE="australia-southeast1-b"
export CLUSTER_NAME="software-secure-supply"
export SERVICE_ACCOUNT=$(gcloud projects describe ${PROJECT_ID} --format="value(projectNumber)")@cloudbuild.gserviceaccount.com
export CSR_NAME="sec-soft-chain"