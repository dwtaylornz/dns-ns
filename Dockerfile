# v 1.0
FROM alpine
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apk update && apk upgrade
RUN apk add bind openrc nano

# Copy Assets and init script
COPY templates/ /etc/bind/
ADD init.sh / 
RUN chmod +x /init.sh

# Volumes
VOLUME [ /sys/fs/cgroup ] 

# Ports
EXPOSE 53/tcp
EXPOSE 53/udp

# start 
CMD ["sh","/init.sh"]
