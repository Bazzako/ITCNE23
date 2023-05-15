#!/bin/bash

ACCESSTOKEN=$1

# einlesen der ID des keys zum Loeschen, welche beim hinzufuegen per API zurueckgegeben wurde.
ID=$(cat /tmp/sshkey-id)

#Warten bis cloud-init finished und disabled wurde
until multipass exec Iacsecurevm -- test -f ../../etc/cloud/cloud-init.disabled
do
  echo "cloud-init.disabled does not exist yet"
  sleep 5
done

# Hier kommt der code zum löschen des SSH-Public-Keys auf gitlab
curl -X DELETE --header "PRIVATE-TOKEN: $ACCESSTOKEN" "https://gitlab.com/api/v4/user/keys/$ID"