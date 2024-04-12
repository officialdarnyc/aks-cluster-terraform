#!/bin/bash

RESOURCE_GROUP="$1"
CLUSTER_NAME="$2"
if [[ -z "$CLUSTER_NAME" || -z "$RESOURCE_GROUP" ]]; then
    echo -e "Please provide both the <resource_group> and <cluster_name> values\n\nExiting..."
	exit 1
fi

POWERSTATE=$(az aks show \
	--resource-group "$RESOURCE_GROUP" \
	--name "$CLUSTER_NAME" \
	--query "powerState.code" -o tsv)

if [[ "$POWERSTATE" -eq "Stopped" ]]; then
	az aks start \
		--resource-group "$RESOURCE_GROUP" \
		--name "$CLUSTER_NAME" \
		--no-wait
fi