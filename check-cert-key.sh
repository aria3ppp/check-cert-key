#!/usr/bin/env bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <certificate_file> <key_file>"
    exit 1
fi

CERT_FILE="$1"
KEY_FILE="$2"

# Check if files exist
if [ ! -f "$CERT_FILE" ]; then
    echo "Error: Certificate file '$CERT_FILE' not found."
    exit 1
fi

if [ ! -f "$KEY_FILE" ]; then
    echo "Error: Key file '$KEY_FILE' not found."
    exit 1
fi

# Extract modulus from certificate
CERT_MODULUS=$(openssl x509 -noout -modulus -in "$CERT_FILE" | openssl md5)

# Extract modulus from private key
KEY_MODULUS=$(openssl rsa -noout -modulus -in "$KEY_FILE" | openssl md5)

# Compare the modulus values
if [ "$CERT_MODULUS" = "$KEY_MODULUS" ]; then
    echo "The certificate and private key match."
else
    echo "The certificate and private key do NOT match."
fi

# Display the modulus values for verification
echo "Certificate Modulus: $CERT_MODULUS"
echo "Private Key Modulus: $KEY_MODULUS"
