#!/bin/bash

CA_NAME=""
CA_NAME_DIR=""

if [[ -n "$1" ]]; then
    CA_NAME="$1"
    CA_NAME_DIR="ca-$1"
else
    echo "Usage: gen-root-ca.sh <CA-NAME>"
    exit 1
fi

OLD_DIR=`(pwd)`

cd ${CA_NAME_DIR}

# Step 1, generate the key and the CSR
openssl req -new -config ${CA_NAME}.conf -out root-ca.csr -keyout private/root-ca.key -nodes

# Step 2, create a self-signed certificate
openssl ca -selfsign -config ${CA_NAME}.conf -in root-ca.csr -out root-ca.crt -extensions ca_ext -batch

cd ${OLD_DIR}