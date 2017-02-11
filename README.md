**Application**

[DSLStats](http://www.s446074245.websitehome.co.uk/downloads.html)


**Usage**
```
docker run -d \
    --name=<container name> \
	-p <vnc port>:5900 \
	-e "VNC_PASSWORD=<vnc password>"
    -v <path for DSLStats config files to be stored>:/config \
    -v /etc/localtime:/etc/localtime:ro \
    rossallan/dslstats
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

Connect using VNC to port 5900 (or the port you configured) to set up DSLstats.

**Example**
```
docker run -d \
    --name=dslstats \
	-p 5900:5900 \
	-e "VNC_PASSWORD=12345678" \
    -v /mnt/cache/appdata/dslstats:/config \
    -v /etc/localtime:/etc/localtime:ro \
    rossallan/dslstats
```
