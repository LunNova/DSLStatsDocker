#!/bin/sh
apt-get update && apt-get install -y --force-yes --no-install-recommends \
    supervisor xinetd x11vnc xvfb tinywm openbox xdotool wmctrl x11-utils xterm libgtk2.0-0 wget curl \
    && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

cd /root/
wget -O dslstats.tar.gz http://dslstats.me.uk/files/dslstats64L-5.9.tar.gz
tar -zxvf dslstats.tar.gz
rm dslstats.tar.gz
mv dslstats64L-5.9 dslstats
ls
chmod +x dslstats/dslstats

echo "Europe/London" > /etc/timezone
rm /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

mkdir ~/.vnc
