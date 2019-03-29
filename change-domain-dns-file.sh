#!/bin/bash

#  To correct file content inconsistency

LIST=$(cat /teknisa/route53-migration/name.txt)
for line in ${LIST[@]} ; do
        sed -i "s/teknisa.com/${line}.com.br/g" $line.com.br;
done