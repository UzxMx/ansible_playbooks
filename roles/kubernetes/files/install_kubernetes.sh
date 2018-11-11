#!/bin/bash

# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
# cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
# deb http://apt.kubernetes.io/ kubernetes-xenial main
# EOF
#
# args=""
# if [ "$HTTP_PROXY" != "" ]; then
#   args="-o Acquire::http::proxy=$HTTP_PROXY"
# fi
# if [ "$HTTP_PROXY" != "" ]; then
#   args="$args -o Acquire::https::proxy=$HTTPS_PROXY"
# fi
# apt-get update $args
# apt-get install $args -y kubelet kubeadm kubectl

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
