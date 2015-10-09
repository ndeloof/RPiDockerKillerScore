#!/bin/bash

HERE=$(dirname "$0")

cp -r "$HERE/conf/." /

# don't launch docker on boot
systemctl disable docker
systemctl disable ntp
systemctl disable rng-tools.service
systemctl disable cron.service

[[ ! -x /sbin/mkfs.btrfs ]] && apt-get install -y btrfs-tools

sysctl --system

