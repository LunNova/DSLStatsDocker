#!/bin/bash

ln -s /config /root/.dslstats

if [ "x$FIX_PERMISSIONS"="xtrue" ]; then
	chmod -R 0777 /root/.dslstats
fi

x11vnc -storepasswd "$VNC_PASSWORD" ~/.vnc/passwd

Xvfb $DISPLAY -screen 0 1600x900x24 &
sleep 5
x11vnc -forever -usepw -display $DISPLAY -shared &
sleep 5
cd /root/dslstats
./dslstats startrecording
wait $!
