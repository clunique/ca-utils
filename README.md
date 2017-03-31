# How to use #

## New a root CA ##
### new-root-ca.sh
./new-root-ca.sh nscloud

### Generate the root CA ###
./gen-root-ca.sh nscloud

### Generate the sub CA ###
./gen-sub-ca.sh nscloud

### Generate the server certicifate request ###
./gen-csr.sh uc-dev.nscloud.local

### Issue the certicifate for the server ###

./issue-cert.sh -a nscloud -n uc-dev.nscloud.local