#!/bin/sh
set -e

apt-get update && apt-get install -y --force-yes --no-install-recommends \
    supervisor xinetd x11vnc xvfb tinywm openbox xdotool wmctrl x11-utils xterm libgtk2.0-0 libssl-dev wget curl \
    && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

cd /root/
wget -O dslstats.tar.gz http://dslstats.me.uk/files/dslstats64L-6.5.tar.gz
tar -zxvf dslstats.tar.gz
rm dslstats.tar.gz
mv dslstats64L-6.5 dslstats
chmod +x dslstats/dslstats

echo "Europe/London" > /etc/timezone
rm /etc/localtime || true
dpkg-reconfigure -f noninteractive tzdata

mkdir ~/.vnc
