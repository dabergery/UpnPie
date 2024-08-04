#!/bin/bash

# V  rifier que l'utilisateur a fourni l'IP et le port
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <IP_ADDRESS> <PORT>"
    exit 1
fi

# R  cup  rer les param  tres IP et PORT
ROUTER_IP="$1"
ROUTER_PORT="$2"

# Envoi de la requ  te M-SEARCH
curl -v -X M-SEARCH "http://$ROUTER_IP:$ROUTER_PORT" \
  -H "HOST: $ROUTER_IP:$ROUTER_PORT" \
  -H "MAN: ssdp:discover" \
  -H "MX: 3" \
  -H "ST: ssdp:all"
