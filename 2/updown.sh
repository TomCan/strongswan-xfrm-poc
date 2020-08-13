#!/bin/bash

if [ "$PLUTO_VERB" == "up-client" ]
then
    if [ "$PLUTO_CONNECTION" == "S1_P2" ]
    then
        ip link set ipsec1 up
        ip add add 192.168.102.254/24 dev ipsec1
        ip route add 192.168.101.0/24 dev ipsec1 metric 10
        ip route add 192.168.103.0/24 dev ipsec1 metric 20
    fi

    if [ "$PLUTO_CONNECTION" == "S3_P2" ]
    then
        ip link set ipsec3 up
        ip add add 192.168.102.254/24 dev ipsec3
        ip route add 192.168.103.0/24 dev ipsec3 metric 10
        ip route add 192.168.101.0/24 dev ipsec3 metric 20
    fi
fi

if [ "$PLUTO_VERB" == "down-client" ]
then
    if [ "$PLUTO_CONNECTION" == "S1_P2" ]
    then
        ip link set ipsec1 down
    fi

    if [ "$PLUTO_CONNECTION" == "S3_P2" ]
    then
        ip link set ipsec3 down
    fi
fi