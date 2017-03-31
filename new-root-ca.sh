#!/bin/bash

CA_NAME=""
CA_NAME_DIR=""

if [[ -n "$1" ]]; then
    CA_NAME="$1"
    CA_NAME_DIR="ca-$1"
else
    echo "Usage: new-root-ca.sh <CA-NAME>"
    exit 1
fi

OLD_DIR=`(pwd)`

mkdir -p ${CA_NAME_DIR}
cd ${CA_NAME_DIR}
mkdir -p certs db private
chmod 700 private
touch db/index
openssl rand -hex 16 > db/serial
echo 1001 > db/crlnumber

mkdir -p sub-ca
cd sub-ca
mkdir -p certs db private
chmod 700 private
touch db/index
openssl rand -hex 16 > db/serial
echo 1001 > db/crlnumber

cd ${OLD_DIR}

cp root-ca/root-ca.conf ${CA_NAME_DIR}/root-ca.conf
cp root-ca/sub-ca/sub-ca.conf ${CA_NAME_DIR}/sub-ca/sub-ca.conf