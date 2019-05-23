#!/bin/bash

# This script migrate a dns's file create by bind (ex.: exemple.com) that contains their records to Route 53
# Remember that dns's file must existe in a current directory of script 
# Ps.: Cli53 have been installed
# Author: Atila Castro
# Date 20/03/2019

# Usage: . migration-to-route53

ZONES=$(cat /teknisa/route53-migration/file.txt)
ZONES=(${ZONES})

for LINE in ${ZONES[@]}; do
ZONEXIST=$(cli53 list | awk '{print "" $2}' | grep "^$LINE.$" | wc -l)

if [ "$ZONEXIST" -ge "1" ];
  then
        echo $LINE " exist "

elif [ "$ZONEXIST" -eq "0" ];
  then
           echo $LINE " do not exist, creating... "
           cli53 create $LINE --comment 'Domain'
           cli53 import --file $LINE --replace --wait $LINE
fi
done