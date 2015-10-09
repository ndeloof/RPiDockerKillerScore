#!/bin/bash

while true; do
  sleep 60
  echo 3 > /proc/sys/vm/drop_caches
done

