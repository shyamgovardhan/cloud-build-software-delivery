#!/usr/bin/env bash

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

cd ..
CLOUDBUILD_YAML=./cloudbuild.yaml
sed -i "s/<ZONE>/${ZONE}/g" ${CLOUDBUILD_YAML}
sed -i "s/<REGION>/${REGION}/g" ${CLOUDBUILD_YAML}
sed -i "s/<PROJECT\_ID>/${PROJECT_ID}/g" ${CLOUDBUILD_YAML}
sed -i "s/<REPO>/${PROJECT_ID}-repo/g" ${CLOUDBUILD_YAML}
sed -i "s/<IMAGE>/image/g" ${CLOUDBUILD_YAML}
cd -