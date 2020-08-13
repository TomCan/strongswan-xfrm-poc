#!/bin/sh
ip link add ipsec1 type xfrm dev lo if_id 0xff01
sysctl -w net.ipv4.conf.ipsec1.disable_policy=1
ip link set ipsec1 up
ip route add 192.168.101.0/24 dev ipsec1 metric 10
ip route add 192.168.102.0/24 dev ipsec1 metric 20

ip link add ipsec2 type xfrm dev lo if_id 0xff02
sysctl -w net.ipv4.conf.ipsec2.disable_policy=1
ip link set ipsec2 up
ip route add 192.168.101.0/24 dev ipsec2 metric 20
ip route add 192.168.102.0/24 dev ipsec2 metric 10

