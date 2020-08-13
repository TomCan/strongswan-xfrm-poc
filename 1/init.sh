#!/bin/sh
ip link add ipsec2 type xfrm dev lo if_id 102
ip link set ipsec2 up
ip address add 192.168.101.254/24 dev ipsec2
ip route add 192.168.102.0/24 dev ipsec2 metric 10
ip route add 192.168.103.0/24 dev ipsec2 metric 20

ip link add ipsec3 type xfrm dev lo if_id 103
ip link set ipsec3 up
ip address add 192.168.101.254/24 dev ipsec3
ip route add 192.168.103.0/24 dev ipsec3 metric 10
ip route add 192.168.102.0/24 dev ipsec3 metric 20

swanctl --load-all