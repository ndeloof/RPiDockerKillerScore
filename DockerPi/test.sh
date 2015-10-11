#! /bin/bash
COUNT=`ps -ef | grep httpd | wc -l`
echo "$(($COUNT-1)) webservers running"

curl http://localhost:$(shuf -i 10001-$((10000+$COUNT)) -n 1)
