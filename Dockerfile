FROM alpine:latest

# Install strongswan and iptables
RUN apk add --update strongswan iptables bash nano net-tools curl tcpdump rsyslog && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*


# Internally uses port 500/udp and 4500/udp
EXPOSE 500/udp
EXPOSE 4500/udp

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
