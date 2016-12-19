FROM cseelye/rpi-raspbian-cross
MAINTAINER Carl Seelye <cseelye@gmail.com>

RUN [ "cross-build-start" ]
RUN apt-get update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install ddclient && \
    apt-get --assume-yes clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN [ "cross-build-end" ]

CMD ["/usr/sbin/ddclient", "-daemon=300", "-foreground", "-verbose"]

