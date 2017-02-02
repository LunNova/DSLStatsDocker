#!/bin/sh
apt-get update && apt-get install -y --force-yes --no-install-recommends \
    supervisor xinetd x11vnc xvfb tinywm openbox xdotool wmctrl x11-utils xterm libgtk2.0-0 \
    && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

chmod +x /root/stats/dslstats

mkdir ~/.vnc
x11vnc -storepasswd "$VNC_PASSWORD" ~/.vnc/passwd
