#!/bin/bash

# Use an older version of the client tooling
# until issue #86 is fixed.
# https://github.com/bitnami-labs/sealed-secrets/issues/86#issuecomment-421556209
release="v0.12.1"

# Install client tooling
GOOS=$(go env GOOS)
GOARCH=$(go env GOARCH)
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/$release/kubeseal-$GOOS-$GOARCH
sudo install -m 755 kubeseal-$GOOS-$GOARCH /usr/local/bin/kubeseal
