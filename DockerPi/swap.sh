#!/bin/bash

dd if=/dev/zero of=/swapfile bs=1024 count=65536
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
