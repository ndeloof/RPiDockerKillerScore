We use a RPi 1 because ... we have many of them :P and they fail earlier so it takes less time to experiment options.

1. Starting with a plain hypriot OS image (hypriot-rpi-20150928-174643.img)
 
 We use [this script](start-webservers.sh) to run webservers containers
 * Container run with `--net=host` as a dedicated IP stack per process is highly resource consuming, and the httpd process do accept port to bind to as argument
 * Container run with `--log-driver=none` as such a driver do consume resources, and we need to be thrifty

We can only run *70* containers before docker crash. 
System state with 69 running containers :
```
$ ps -ef|grep -c httpd
69
$ vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 282096  20624  67696    0    0    
```

2. Tunning

We made various attemps to tweak kernel / docker daemon, but always fail with same 70 container limit.

3. Got some tips from https://github.com/dduportal/rpi-utils/tree/hypr-challenge/challenge

Could just pick-up this solution, but won't learn anything, so restarted from scratch and tried some of the hacks Damien used to get 2334 webservers.
We were able to get more than 70 containers once we set `LimitNPROC=infinity` on docker daemon systemd config.

So the question : how could we know this looking into `/var/log/daemon.log`? Where to look for `EAGAIN` error (according to http://man7.org/linux/man-pages/man2/setrlimit.2.html)


