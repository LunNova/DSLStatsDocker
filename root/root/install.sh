#!/bin/sh
apt-get update && apt-get install -y --force-yes --no-install-recommends \
    supervisor xinetd x11vnc xvfb tinywm openbox xdotool wmctrl x11-utils xterm libgtk2.0-0 wget curl \
    && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

cd /root/
wget http://www.s446074245.websitehome.co.uk/files/dslstats64L-5.8.tar.gz
tar -zxvf dslstats64L-5.8.tar.gz
rm dslstats64L-5.8.tar.gz
mv dslstats64L-5.8 dslstats
ls
chmod +x dslstats/dslstats

mkdir ~/.vnc
