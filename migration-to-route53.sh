#!/bin/bash

ZONES=$(cat /teknisa/route53-migration/file.txt)
ZONES=(${ZONES})
#ZONEXIST=$(cat /tmp/zonexist)

for LINE in ${ZONES[@]}; do
ZONEXIST=$(cli53 list | awk '{print "" $2}' | grep -i $LINE | wc -l)

#COUNT=(${ZONEXIST})

if [ "$ZONEXIST" -ge "1" ];
  then
        echo $LINE " exist "

elif [ "$ZONEXIST" -eq "0" ];
  then
           echo $LINE " do not exist "
           cli53 create $LINE --comment 'Domain'
           cli53 import --file $LINE --replace --wait $LINE
fi
#rm -rf $ZONEXIST
done