#!/bin/bash

bash /etc/init.sh
ipsec start

while true; do sleep 10000; done
