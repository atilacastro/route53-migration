#!/bin/bash

# Get just NS records and Domain name

# Usage: . catch-ns-domains.sh > ns-domains

ZONES=$(cat /teknisa/route53-migration/hosted-zones-id)
ZONES=(${ZONES})

for LINE in ${ZONES[@]}; do
           echo " Catch a $LINE NS Resource Record "
          aws route53 list-resource-record-sets --hosted-zone-id $LINE --query "ResourceRecordSets[?Type == 'NS']" | grep -v ResourceRecords | grep -v TTL | grep -v Type | cut -d '{' -f 1-5 --output-delimiter=' ' | cut -d '}' -f 1-5 --output-delimiter=' ' | cut -d ',' -f 1-5 --output-delimiter=' ' | cut -d '"' -f 1-5 --output-delimiter=' ' | cut -d ']' -f 1-5 --output-delimiter=' ' | cut -d '[' -f 1-5 --output-delimiter=' ' | awk 'NF>0'
done