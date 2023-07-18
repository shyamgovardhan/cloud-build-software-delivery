#!/usr/bin/env bash

CLOUDBUILD_YAML=../cloudbuild.yaml
sed -i "s/<ZONE>/$ZONE/g" ${CLOUDBUILD_YAML}
sed -i "s/<REGION>/$REGION/g" ${CLOUDBUILD_YAML}
sed -i "s/<PROJECT\_ID>/${PROJECT_ID}/g" ${CLOUDBUILD_YAML}
sed -i "s/<REPO>/${PROJECT_ID}-repo/g" ${CLOUDBUILD_YAML}
sed -i "s/<IMAGE>/image/g" ${CLOUDBUILD_YAML}