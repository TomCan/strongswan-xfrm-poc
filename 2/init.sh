#!/bin/sh
ip link add ipsec1 type xfrm dev lo if_id 101
ip link add ipsec2 type xfrm dev lo if_id 102
ip link add ipsec3 type xfrm dev lo if_id 103