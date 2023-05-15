#!/bin/bash

multipass delete Iacsecurevm
multipass purge
multipass launch -n Iacsecurevm --cloud-init /tmp/user-data_iac.yml