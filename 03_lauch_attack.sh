#!/bin/bash

CONTROL_URL="${3}"

if [ -z "$CONTROL_URL" ]; then
  echo "Error"
  exit 1
fi

curl -v \
  --http1.1 \
  -X 'POST' \
  -H 'Content-Type: text/xml; charset="utf-8"' \
  -H 'Connection: close' \
  -H 'SOAPAction: "urn:schemas-upnp-org:service:WANIPConnection:1#AddPortMapping"' \
  --data @Firewall.xml "$CONTROL_URL"

