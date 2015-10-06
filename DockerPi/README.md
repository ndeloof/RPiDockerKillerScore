# Our experiments on [RpiDocker](http://blog.docker.com/2015/09/update-raspberry-pi-dockercon-challenge/)

## tmpfs
First run on a RPi with base hypriot system took 2 minutes to run ... 37 containers, then crashed
```
```


## Enable memory overcommit
`echo 1 > /proc/sysm/vm/overcommit/memory`
=> 70 containers

## tmpfs
Idea: create a tmpfs (RAM filesystem) for /var/lib/docker so creating container don't depend on SD card performances


## run without docker 
mostly to get some metrics on the system limits to run a large number of http servers. Disable unused kernel modules



## Use Go 1.5 for Docker
Go 1.5 has a better GC which could help reduce Docker daemon memory consumption



