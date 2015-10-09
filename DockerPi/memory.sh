#!/bin/bash

echo $(($(cat /sys/block/zram0/compr_data_size) / 1024)) ; echo $(($(cat /sys/block/zram1/compr_data_size) / 1024)); free; df -h; cat /proc/meminfo

