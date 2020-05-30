#!/bin/bash

# This script bootstraps an (ideally, blank) Kubernetes cluster to install
# - Sealed Secrets
# - Weave Flux
# and to configure itself based on the contents of this repository.

kubectl apply -f bootstrap/flux-namespace.yaml

if [ ! -f secrets/sealed-secrets-master-key.yaml ]; then
    echo "Sealed Secrets master key not found. Aborting..."
    exit -1
fi

kubectl apply -f secrets/sealed-secrets-master-key.yaml

KUBESEAL_VERSION="v0.12.4"
kubectl create -f https://github.com/bitnami-labs/sealed-secrets/releases/download/${KUBESEAL_VERSION}/controller.yaml

kubectl apply -f bootstrap/flux-git-deploy.yaml
kubectl apply -f bootstrap/flux-deployment.yaml
