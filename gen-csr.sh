#!/bin/bash


CN_NAME="$1"

if [[ -n "$1" ]]; then
    CN_NAME="$1"
else
    echo "Usage: gen-csr.sh <CN-NAME>"
    echo "For example: gen-csr.sh uc-dev.nscloud.local"
    exit 1
fi

echo "CN: ${CN_NAME}"

openssl genrsa -out csr/${CN_NAME}.key 2048

openssl req -new -config csr/${CN_NAME}.conf -key csr/${CN_NAME}.key -out csr/${CN_NAME}.csr

