#!/bin/bash

# start syslog
rsyslogd

# run init.sh
bash /etc/init.sh

# start ipsec
ipsec start

# load config
swanctl --load-all
while [ "$R" != "0" ]
do
    sleep 0.5
    swanctl --load-all
    R=$?
done

while true; do tail -f /var/log/messages; done
