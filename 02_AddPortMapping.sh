#!/bin/bash

# V  rifier si l'URL de contr  le est fournie en tant qu'argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <CONTROL_URL>"
    exit 1
fi

# R  cup  rer l'URL de contr  le depuis les arguments
CONTROL_URL=$1

# V  rifier si le fichier SOAP_NAT_INJECTION.xml existe
if [ ! -f "SOAP_NAT_INJECTION.xml" ]; then
    echo "SOAP_NAT_INJECTION.xml not found."
    exit 1
fi

# Ex  cuter la commande curl avec les param  tres fournis
curl -v \
--trace-ascii /dev/stdout \
--http1.1 \
-X 'POST' \
-H 'Content-Type: text/xml; charset="utf-8"' \
-H 'Connection: close' \
-H 'SOAPAction: "urn:schemas-upnp-org:service:WANIPConnection:1#AddPortMapping"' \--data @SOAP_NAT_INJECTION.xml \
"$CONTROL_URL"
