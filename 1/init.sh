#!/bin/sh
ip link add ipsec2 type xfrm dev eth0 if_id 0xff02
sysctl -w net.ipv4.conf.ipsec2.disable_policy=1
ip link set ipsec2 up
ip route add 192.168.102.0/24 dev ipsec2 metric 10
ip route add 192.168.103.0/24 dev ipsec2 metric 20

ip link add ipsec3 type xfrm dev eth0 if_id 0xff03
sysctl -w net.ipv4.conf.ipsec3.disable_policy=1
ip link set ipsec3 up
ip route add 192.168.102.0/24 dev ipsec3 metric 20
ip route add 192.168.103.0/24 dev ipsec3 metric 10
