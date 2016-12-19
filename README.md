# rpi-ddclient
Docker container for hosting ddclient on Raspberry Pi

### Usage
Create a ddclient.conf file for your specific needs.  
You can either use this container as-is, and mount your config file into it:  
```docker run --volume ddclient.conf:/etc/ddclient/ddclient.conf --restart always --detach cseelye/rpi-ddclient```

or create your own image with your config file baked in:
```
FROM cseelye/rpi-ddclient
COPY ddclient.conf /etc/ddclient/ddclient.conf
```

