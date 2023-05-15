#!/bin/bash

ACCESSTOKEN=$1

if [ -z $ACCESSTOKEN ] ; then
  echo "no accesstoken"
  exit 1
fi
#Erzeugen von temporaerem iackey
ssh-keygen -t rsa -N "" -f /tmp/iackey <<< y
sed 's/^/    /g' /tmp/iackey > /tmp/iackey.mod

#Erzeugen von postdata für Rest-API call 
echo '{ "title": "cloudinit", "usage_type": "auth",' > /tmp/postdata
echo '"key": "'$(cat /tmp/iackey.pub)'" }' >> /tmp/postdata

#Erzeugen von Key per REST-API
curl -X POST --header "PRIVATE-TOKEN: $ACCESSTOKEN" \
     --header "Content-Type: application/json" \
     --data @/tmp/postdata \
     --output /tmp/curl.out \
     "https://gitlab.com/api/v4/user/keys"

#Auswerten des return werts fuer sshkey id zum spaeteren loeschen des keys
sed 's/.*"id":\([0-9]*\),.*/\1/' /tmp/curl.out > /tmp/sshkey-id