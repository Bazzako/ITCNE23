#!/bin/bash

cd "$(dirname "$0")" || exit

./1_KeyPairgenerate.sh "glpat-31uWYjAniRyycmKmC2jM"
./2_setsshkeysed.sh
./3_vmlaunch.sh
./4_removeactoken.sh "glpat-31uWYjAniRyycmKmC2jM"