#!/bin/bash

HERE=$(dirname "$0")

cp -r "$HERE/conf" /

# don't launch docker on boot
systemctl disable docker

sysctl --system

