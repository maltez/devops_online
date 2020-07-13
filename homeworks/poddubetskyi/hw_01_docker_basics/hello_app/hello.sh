#!/usr/bin/env sh
[ -z "${HOST}" ] && HOST=0.0.0.0
[ -z "${PORT}" ] && PORT=8880 
trap "echo Terminating... ; exit" SIGHUP SIGINT SIGTERM
while true; do { 
  echo -e "HTTP/1.1 200 OK\r\n$(date)\r\n\r\n<h1>Docker basics hello app</h>" \
  "<h3>Host: $(hostname); Date: $(date "+%0Y.%0m.%0d %0H:%0M:%0S")</h3>" ;
  } |  nc -q 1 -vl -p ${PORT} ${HOST} ;
done
