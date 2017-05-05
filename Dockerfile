FROM alpine:3.5
MAINTAINER Toshiyuki HIRANO <hiracchi@gmail.com>


RUN apk update \
  && apk add --no-cache dhcp \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /run/nginx


COPY docker-entrypoint.sh /
EXPOSE 67/udp
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/dhcpd", "-cf", "/etc/dhcp/dhcpd.conf"] 
