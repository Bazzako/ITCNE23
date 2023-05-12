#!/bin/bash

sed '/SSH-KEY-PLACE/r /tmp/iackey' $(dirname $0)/user-data-iac.yml | sed '/SSH-KEY-PLACE/d'> /tmp/user-data_iac.yml
!/bin/bash