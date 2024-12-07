#!/bin/bash

CERTS_DIR="./certs"
CERT_FILE="$CERTS_DIR/self-signed.crt"
KEY_FILE="$CERTS_DIR/self-signed.key"
CONFIG_FILE="$CERTS_DIR/openssl.cnf"

# Create certs directory if it doesn't exist
mkdir -p "$CERTS_DIR"

# Create OpenSSL configuration file for SAN
cat > "$CONFIG_FILE" <<EOF
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
C = US
ST = Test
L = Local
O = Example
OU = Dev
CN = nginx.avb

[v3_req]
subjectAltName = @alt_names

[alt_names]
DNS.1 = nginx.avb
EOF

# Generate a self-signed certificate with SAN
openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout "$KEY_FILE" \
  -out "$CERT_FILE" \
  -days 365 \
  -config "$CONFIG_FILE"

echo "Self-signed certificate with SAN for nginx.avb generated in the $CERTS_DIR directory."