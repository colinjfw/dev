#!/bin/sh
set -e

version=$(curl --silent https://storage.googleapis.com/kubernetes-release/release/stable.txt)
echo "Installing kubernetes $version"
curl --silent -LO https://storage.googleapis.com/kubernetes-release/release/$version/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl

version=$(curl --silent "https://api.github.com/repos/helm/helm/releases/latest" | jq -r .tag_name)
echo "Installing helm $version"
curl --silent -o helm.tgz -LO https://get.helm.sh/helm-$version-linux-amd64.tar.gz
tar -zxf helm.tgz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64
