# v 1.0
FROM alpine
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apk update && apt upgrade
RUN apk add bind openrc

# Copy Assets, setup and init scripts
COPY /templates /bind/etc/
ADD setup.sh / 
ADD init.sh / 

# Run Init 
RUN bash setup.sh

# Volumes
VOLUME [ /sys/fs/cgroup ] 

# Ports
EXPOSE 53/tcp
EXPOSE 53/udp

# start 
CMD ["sh","/init.sh"]
