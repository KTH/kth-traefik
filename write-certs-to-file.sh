#!/bin/sh
set -e

echo $TRAEFIK_CERT_PEM | awk  '{gsub("\\\\n","\n")};1' > /kth-certs/cert.pem && chmod 600 /kth-certs/cert.pem
echo $TRAEFIK_CERT_KEY | awk  '{gsub("\\\\n","\n")};1' > /kth-certs/key.pem && chmod 600 /kth-certs/key.pem

# Put traefik infront of command parameters
set -- traefik "$@"

exec "$@"