#!/usr/bin/env bash

# https://cloud.google.com/build/docs/automating-builds/create-manage-triggers#gcloud
# or --tag-pattern=TAG_PATTERN

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

cd ..
TRIGGER_NAME="build-vulnz-deploy"
BRANCH_PATTERN="main"
BUILD_CONFIG_FILE="./cloudbuild.yaml"
_COMPUTE_REGION=${REGION}
_IMAGE_NAME="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/image"
_KMS_KEYRING="binauthz"
_KMS_LOCATION=${REGION}
_VULNZ_ATTESTOR="vulnz-attesto"
_VULNZ_KMS_KEY="vulnz-signer"
_VULNZ_KMS_KEY_VERSION=1
_SONAR_LOGIN=
_SONAR_PROJECT=
_SONAR_ORG=
echo "PWD: ${PWD}"
echo "TRIGGER_NAME: ${TRIGGER_NAME}"
echo "CSR_NAME: ${CSR_NAME}"
echo "BRANCH_PATTERN: ${BRANCH_PATTERN}"
echo "BUILD_CONFIG_FILE: ${BUILD_CONFIG_FILE}"
echo "SERVICE_ACCOUNT: ${SERVICE_ACCOUNT}"
echo "_COMPUTE_REGION: ${_COMPUTE_REGION}"
echo "_IMAGE_NAME: ${_IMAGE_NAME}"
echo "_KMS_KEYRING: ${_KMS_KEYRING}"
echo "_KMS_LOCATION: ${_KMS_LOCATION}"
echo "_VULNZ_ATTESTOR: ${_VULNZ_ATTESTOR}"
echo "_VULNZ_KMS_KEY: ${_VULNZ_KMS_KEY}"
echo "_VULNZ_KMS_KEY_VERSION: ${_VULNZ_KMS_KEY_VERSION}"
echo "_SONAR_LOGIN: ${_SONAR_LOGIN}"
echo "_SONAR_PROJECT: ${_SONAR_PROJECT}"
echo "_SONAR_ORG: ${_SONAR_ORG}"

#--service-account=${SERVICE_ACCOUNT} \

gcloud beta builds triggers create cloud-source-repositories \
    --name=${TRIGGER_NAME} \
    --repo=${CSR_NAME} \
    --branch-pattern=${BRANCH_PATTERN} \
    --build-config=${BUILD_CONFIG_FILE} \
    --require-approval \
    --substitutions=_COMPUTE_REGION=${_COMPUTE_REGION},_IMAGE_NAME=${_IMAGE_NAME},_KMS_KEYRING=${_KMS_KEYRING},_KMS_LOCATION=${_KMS_LOCATION},_SONAR_LOGIN=${_SONAR_LOGIN},_VULNZ_ATTESTOR=${_VULNZ_ATTESTOR},_VULNZ_KMS_KEY=${_VULNZ_KMS_KEY},_VULNZ_KMS_KEY_VERSION=${_VULNZ_KMS_KEY_VERSION}
cd -