#!/bin/bash

ln -s /config /root/.dslstats

if [ "x$FIX_PERMISSIONS"="xtrue" ]; then
	chmod -R 0777 /root/.dslstats
fi

x11vnc -forever -usepw -create &
sleep 20
cd /root/stats
./dslstats startrecording
wait $!
