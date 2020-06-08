# v 1.0
FROM alpine
MAINTAINER dwtaylornz@gmail.com

# Install Pre-reqs
RUN apt update && apt upgrade
RUN apt add bind openrc

# Copy Assets
COPY /templates /bind/etc/
ADD init.sh / 
ADD start_dns.sh /

# Run Init 
RUN bash init.sh

# Volumes


# Ports
EXPOSE 53/tcp
EXPOSE 53/udp

# start 
CMD ["sh","/start_dns.sh"]
