#!/bin/bash

sed '/SSH-KEY-PLACE/r /tmp/iackey.mod' $(dirname $0)/user-data_iac.yml | sed '/SSH-KEY-PLACE/d'> /tmp/user-data_iac.yml