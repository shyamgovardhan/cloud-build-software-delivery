#!/usr/bin/env bash

# https://github.com/GoogleCloudPlatform/cloud-build-software-delivery

cbsd="./00-cbsd-init.sh"
[[ ! -f ${cbsd} ]] && echo "${cbsd}: file not found!" && exit
. ${cbsd}

# --enable-binauthz \
# Create a cluster for this demo, not production ready settings being used here
gcloud beta container clusters create "${CLUSTER_NAME}" \
--project ${PROJECT_ID} \
--zone $ZONE --no-enable-basic-auth \
--cluster-version "1.26.5-gke.1200" \
--release-channel "regular" \
--machine-type "e2-standard-4" \
--image-type "COS_CONTAINERD" \
--disk-type "pd-standard" \
--disk-size "100" \
--metadata disable-legacy-endpoints=true \
--enable-autoupgrade --enable-autorepair \
--max-surge-upgrade 1 \
--max-unavailable-upgrade 1 \
--enable-shielded-nodes --node-locations $ZONE \
--binauthz-evaluation-mode=PROJECT_SINGLETON_POLICY_ENFORCE \
--location-policy=BALANCED \
--scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --max-pods-per-node "110" --num-nodes "2" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM --enable-ip-alias --network "projects/${PROJECT_ID}/global/networks/default" --subnetwork "projects/${PROJECT_ID}/regions/${REGION}/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver \
