#!/bin/bash


CN_NAME="$1"

if [[ -n "$1" ]]; then
    CA_NAME="$1"
else
    echo "Usage: gen-csr.sh <CA-NAME>"
    exit 1
fi

openssl genrsa -out csr/${CA_NAME}.key 2048

openssl req -new -config csr/${CA_NAME}.conf -key csr/${CA_NAME}.key -out csr/${CA_NAME}.csr

