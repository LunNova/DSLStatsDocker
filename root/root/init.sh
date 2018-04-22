#!/bin/bash

rm /tmp/.X0*

ln -s /config /root/.dslstats

if [ "x$FIX_PERMISSIONS"="xtrue" ]; then
	chmod -R 0777 /root/.dslstats
fi

x11vnc -storepasswd "$VNC_PASSWORD" ~/.vnc/passwd

Xvfb $DISPLAY -screen 0 1600x900x24 &
PID=$!
sleep 5

x11vnc -forever -usepw -display $DISPLAY -shared &
PID2=$!
sleep 5

if [ -d /root/.dslstats/webserver/]; then
	mv /root/.dslstats/webserver/ /root/.dslstats/Webserver/
fi

mkdir -p /root/.dslstats/Webserver/
cd /root/.dslstats/Webserver/

python -m SimpleHTTPServer 8080 &
PID3=$!

cd /root/dslstats
./dslstats startrecording

wait $PID
wait $PID2
wait $PID3
