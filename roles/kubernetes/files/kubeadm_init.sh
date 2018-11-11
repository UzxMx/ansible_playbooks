#!/bin/bash

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 >$HOME/kubeadm.log
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# For flannel to work correctly, you must pass --pod-network-cidr=10.244.0.0/16 to kubeadm init.
#
# Set /proc/sys/net/bridge/bridge-nf-call-iptables to 1 by running sysctl net.bridge.bridge-nf-call-iptables=1 to pass bridged IPv4 traffic to iptables’ chains. This is a requirement for some CNI plugins to work, for more information please see here.
#
# Note that flannel works on amd64, arm, arm64 and ppc64le.
#
# When pulling image from quay.io/coreos/flannel, we may suffer from network problem, please try several times.
#
# CoreDNS will not be in running state until flannel is in running state. After the two are in running state, you're good to go.
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
