# v 1.0
FROM alpine
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apt update && apt upgrade
RUN apt add bind openrc

# 
ADD zone.txt /bind/etc
ADD named.conf /bind/etc
ADD init.sh / 
ADD start_dns.sh /

# Run Init 
RUN init.sh

# Volumes
#VOLUME 

# Ports
EXPOSE 53/tcp
EXPOSE 53/udp

# start 
CMD ["sh","/start_dns.sh"]
