## unifi dockerfile

#FROM resin/rpi-raspbian
FROM sdhibit/rpi-raspbian

MAINTAINER Jared Orcutt <jporcutt@gmail.com>

VOLUME ["/var/lib/unifi/data"]
CMD ["/etc/init.d/unifi","start"]
EXPOSE 8443

RUN echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | tee -a /etc/apt/sources.list.d/ubnt.list > /dev/null

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

RUN apt-get update && \
apt-get upgrade -yqq && \
apt-get install -yqq \
unifi \
net-tools


RUN echo 'ENABLE_MONGODB=no' | tee -a /etc/mongodb.conf > /dev/null

