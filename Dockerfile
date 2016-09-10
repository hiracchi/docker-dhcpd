FROM hiracchi/ubuntu-ja-supervisor
MAINTAINER Toshiyuki HIRANO <hiracchi@gmail.com>

# packages install
RUN apt-get update && apt-get install -y \
    isc-dhcp-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RUN touch /var/db/dhcpd.leases

# for service
COPY supervisor.dhcpd.conf /etc/supervisor/conf.d/dhcp.conf

EXPOSE 67/udp
ENTRYPOINT ["/usr/bin/supervisord"]
 
