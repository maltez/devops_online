#!/bin/sh


PORT=8080
INDEX=$(cat index.html)
RESPONSE="$(mktemp)"


while [ $? -eq 0 ] ; do

( cat $RESPONSE ) | nc -l -p $PORT | (

REQUEST=`while read L && [ " " "<" "$L" ] ; do echo "$L<br />" ; done`
echo "[`date '+%Y-%m-%d %H:%M:%S'`] $REQUEST" | sed -e :a -e 's/<[^>]*>//g;/</N;//ba' | head -1

BODY="$INDEX<br/>$REQUEST"

cat >$RESPONSE << EOF
HTTP/1.1 200 OK
Cache-Control: private
Content-Type: text/html;charset=utf-8
Server: bash/2.0
Connection: Close
Content-Length: ${#BODY}

$BODY
EOF
)

done
