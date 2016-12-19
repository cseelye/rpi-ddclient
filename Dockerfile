FROM cseelye/rpi-raspbian-cross
MAINTAINER Carl Seelye <cseelye@gmail.com>

RUN [ "cross-build-start" ]
RUN apt-get update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install wget libio-socket-ip-perl libio-socket-ssl-perl libjson-any-perl && \
    wget "http://downloads.sourceforge.net/project/ddclient/ddclient/ddclient-3.8.3.tar.gz" -O- | tar xzf - && \
    cp ddclient-3.8.3/ddclient /usr/sbin/ && \
    mkdir -p /etc/ddclient && \
    mkdir /var/cache/ddclient && \
    apt-get --assume-yes clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN [ "cross-build-end" ]

CMD [ "/usr/sbin/ddclient", "-daemon=300", "-foreground", "-debug", "-verbose", "-noquiet" ]

