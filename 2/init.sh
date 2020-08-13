#!/bin/sh
ip link add ipsec1 type xfrm dev lo if_id 101
ip link set ipsec1 up
ip address add 192.168.102.254/24 dev ipsec1
ip route add 192.168.101.0/24 dev ipsec1 metric 10
ip route add 192.168.103.0/24 dev ipsec1 metric 20

ip link add ipsec3 type xfrm dev lo if_id 103
ip link set ipsec3 up
ip address add 192.168.102.254/24 dev ipsec3
ip route add 192.168.103.0/24 dev ipsec3 metric 10
ip route add 192.168.101.0/24 dev ipsec3 metric 20

swanctl --load-all