#!/bin/bash

ROUTER_IP="${1:-192.168.0.1}"
PORTS_SCAN=$( netcat -z -n "$ROUTER_IP" 1900 2>&1 | grep succeeded )

if ( ! echo $PORTS_SCAN | grep 'succeeded' );then
	echo 'Error NO UPNP PORT.'
	PORTS_SCAN="N/A"
fi
echo '[PORTS SCAN]' > online_servers.txt
echo $PORTS_SCAN >> online_servers.txt
cat online_servers.txt
