#!/bin/bash

sudo rmmod xt_addrtype
sudo rmmod iptable_filter
sudo rmmod iptable_nat
sudo rmmod nf_nat_ipv4
sudo rmmod nf_nat
sudo rmmod nf_conntrack_ipv4
sudo rmmod nf_conntrack
sudo rmmod nf_defrag_ipv4
sudo rmmod ip_tables
sudo rmmod x_tables
sudo rmmod br_netfilter
sudo rmmod bridge
sudo rmmod stp
sudo rmmod llc

set -e

DOCKER_IMAGE="hypriot/rpi-nano-httpd"
P1=$1
P2=$2
MAXNR=${P1:="1"}
STARTNR=${P2:="0"}

COUNTER=$STARTNR
while [  $COUNTER -lt $MAXNR ]; do
  let COUNTER=COUNTER+1
  let PORT=10000+COUNTER
  echo COUNTER=$COUNTER, PORT=$PORT
  docker run -d --name=WebServer-$PORT \
                --net=host \
                --log-driver=none \
                $DOCKER_IMAGE /httpd $PORT
done


