#!/bin/bash

sudo kubeadm init --apiserver-advertise-address $api_server_advertise_address --pod-network-cidr=10.244.0.0/16 >$HOME/kubeadm.log
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
#
# Also make sure your default network interface of one flannel host can be reached by another flannel host. You can also specify a particular interface by passing `--iface` flag.
sudo kubectl apply -f $flannel_config_url
