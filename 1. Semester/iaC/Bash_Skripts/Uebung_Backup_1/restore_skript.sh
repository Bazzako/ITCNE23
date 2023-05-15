#!/bin/bash

#Variable erstellen welche für den Restore abgefüllt werden muss

    if [[ -z $1]]; then
     echo "No file found, please insert file"
     exit
    
    elif [[ -z $2]]; then
     echo "no path found, please insert file"
     exit
    
    fi
    

Restorefile=$1
Restorepath=$2

#Entpacken von Backupfile in Pfad
tar -xzvf "Restorefile" "Restorepath"

