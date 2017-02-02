FROM krallin/ubuntu-tini:xenial
MAINTAINER Ross Allan <docker@nallar.me>

ENV LANG=C.UTF-8 \
FIXPERMISSIONS=true \
DISPLAY=:20 \
VNC_PASSWORD=CHANGEME

COPY root/ /
RUN chmod +x /root/*.sh && /bin/sh /root/install.sh

#Expose ports (VNC)
EXPOSE 5900

VOLUME /config

ENTRYPOINT ["/usr/local/bin/tini", "--", "/root/init.sh"]
