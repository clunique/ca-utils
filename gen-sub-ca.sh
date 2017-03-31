#!/bin/bash

CA_NAME=""
CA_NAME_DIR=""

if [[ -n "$1" ]]; then
    CA_NAME="$1"
    CA_NAME_DIR="ca-$1"
else
    echo "Usage: gen-sub-ca.sh <CA-NAME>"
    exit 1
fi

OLD_DIR=`(pwd)`

cd ${CA_NAME_DIR}/sub-ca

# Step 1, generate the key and the CSR
openssl req -new -config sub-ca.conf -out sub-ca.csr -keyout private/sub-ca.key -nodes

# Step 2, we get the root CA to issue a certificate
cd ../
openssl ca -config ${CA_NAME}.conf -in sub-ca/sub-ca.csr -out sub-ca/sub-ca.crt -extensions sub_ca_ext -batch

cd ${OLD_DIR}