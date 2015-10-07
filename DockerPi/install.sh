#!/bin/bash

HERE=$(dirname "$0")

cp -rp "$HERE/conf/." /

# don't launch docker on boot
systemctl disable docker

sysctl --system

