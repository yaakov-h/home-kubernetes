#!/bin/bash
set -e

# This script is to be used to configure a new Kubernetes cluster to
# use this repository as it's source of truth.

CLUSTER_NAME=${1:?Cluster parameter not set}

echo Bootstrapping cluster $CLUSTER_NAME...

./bootstrap/install-weave.sh "${CLUSTER_NAME}"
./bootstrap/install-ingress-nginx.sh
