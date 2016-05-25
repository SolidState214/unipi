## unifi dockerfile

#FROM resin/rpi-raspbian
FROM sdhibit/rpi-raspbian

MAINTAINER Jared Orcutt <jporcutt@gmail.com>

VOLUME ["/var/lib/unifi/data"]

EXPOSE 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp

RUN echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | tee -a /etc/apt/sources.list.d/ubnt.list > /dev/null

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

RUN apt-get update && \
apt-get upgrade -yqq && \
apt-get install -yqq \
unifi \
net-tools


RUN echo 'ENABLE_MONGODB=no' | tee -a /etc/mongodb.conf > /dev/null

WORKDIR /var/lib/unifi
ENTRYPOINT ["/usr/bin/java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar"]
CMD ["start"]
