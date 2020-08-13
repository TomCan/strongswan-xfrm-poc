#!/bin/sh
ip link add ipsec1 type xfrm dev lo if_id 101
ip link set ipsec1 up
ip address add 192.168.102.254/24 dev ipsec1
ip route add 192.168.101.0/24 dev ipsec1 metric 10
ip route add 192.168.102.0/24 dev ipsec1 metric 20

ip link add ipsec2 type xfrm dev lo if_id 102
ip link set ipsec2 up
ip address add 192.168.102.254/24 dev ipsec2
ip route add 192.168.102.0/24 dev ipsec2 metric 10
ip route add 192.168.101.0/24 dev ipsec2 metric 20

swanctl --load-all