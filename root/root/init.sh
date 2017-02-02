#!/bin/bash

ln -s /config /root/.dslstats
x11vnc -forever -usepw -create &
sleep 20
cd /root/stats
./dslstats maximised startrecording
wait $!
