#!/bin/bash

echo "$0 $* --- $PLUTO_VERB - $PLUTO_CONNECTION - $(whoami)"

if [ "$PLUTO_VERB" == "up-client" ]
then
    if [ "$PLUTO_CONNECTION" == "S2_P2" ]
    then
        ip link set ipsec2 up
        ip add add 192.168.101.254/32 dev ipsec2
        ip route add 192.168.102.0/24 dev ipsec2 metric 10
        ip route add 192.168.103.0/24 dev ipsec2 metric 20
    fi

    if [ "$PLUTO_CONNECTION" == "S3_P2" ]
    then
        ip link set ipsec3 up
        ip add add 192.168.101.254/32 dev ipsec3
        ip route add 192.168.103.0/24 dev ipsec3 metric 10
        ip route add 192.168.102.0/24 dev ipsec3 metric 20
    fi
fi

if [ "$PLUTO_VERB" == "down-client" ]
then
    if [ "$PLUTO_CONNECTION" == "S2_P2" ]
    then
        ip link set ipsec2 down
    fi

    if [ "$PLUTO_CONNECTION" == "S3_P2" ]
    then
        ip link set ipsec3 down
    fi
fi