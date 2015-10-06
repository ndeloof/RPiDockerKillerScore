# Our experiments on [RpiDocker](http://blog.docker.com/2015/09/update-raspberry-pi-dockercon-challenge/)

## run without docker 
mostly to get some metrics on the system limits to run a large number of http servers. Disable unused kernel modules

## tmpfs
our first experiments to create docker containers demonstrate slowness to start containers, which would result in days to run a thousand of them.
create a tmpfs (RAM filesystem) for /var/lib/docker so creating container don't depend on SD card performances

## Use Go 1.5 for Docker
Go 1.5 has a better GC which could help reduce Docker daemon memory consumption



