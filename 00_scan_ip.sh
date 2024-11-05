#!/bin/bash

LOCAL_NETWORK="${1:-192.168.0.0/24}"
SCAN=$( sudo nmap -sP -Pn -T4 "$LOCAL_NETWORK" 2>&1 | grep ')' )

echo '[ONLINE SERVERS]' > IP_SCAN.txt
echo $SCAN >> IP_SCAN.txt
cat IP_SCAN.txt
