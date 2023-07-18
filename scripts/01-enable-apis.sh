#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

gcloud services enable container.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable ondemandscanning.googleapis.com
gcloud services enable cloudkms.googleapis.com
gcloud services enable binaryauthorization.googleapis.com
gcloud services enable cloudbuild.googleapis.com