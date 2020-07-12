#!/usr/bin/env sh
# Источники кода "сервера": https://fabianlee.org/2016/09/26/ubuntu-simulating-a-web-server-using-netcat/
# Закрыть соедининение после отправки ответа: https://serverfault.com/a/880289
# Обработка сигналов в сценарии оболочки: http://linuxcommand.org/lc3_wss0150.php
trap "echo Terminating... ; exit" SIGHUP SIGINT SIGTERM
while true; do { 
  echo -e "HTTP/1.1 200 OK\r\n$(date)\r\n\r\n<h1>Docker basics hello app</h>" \
  "<h3>Host: $(hostname); Date: $(date "+%0Y.%0m.%0d %0H:%0M:%0S")</h3>" ;
  } |  nc -q 1 -vl -p ${PORT} 0.0.0.0 ;
done
