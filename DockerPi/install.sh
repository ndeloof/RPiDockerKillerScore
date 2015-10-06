#!/bin/bash

HERE=$(dirname "$0")

cp "$HERE/conf" /

# don't launch docker on boot
systemctl disable docker


