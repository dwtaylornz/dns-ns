# v 1.0
FROM alpine
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apk update && apk upgrade
RUN apk add bind openrc nano

# Copy Assets, setup and init scripts
COPY /templates /bind/etc/
ADD setup.sh / 
ADD init.sh / 

# Run Init 
RUN chmod +x /setup.sh
RUN chmod +x /init.sh
RUN /setup.sh

# Volumes
VOLUME [ /sys/fs/cgroup ] 

# Ports
EXPOSE 53/tcp
EXPOSE 53/udp

# start 
CMD ["sh","/init.sh"]
