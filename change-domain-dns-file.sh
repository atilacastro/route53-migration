#!/bin/bash

#  To correct file content inconsistency

LIST=$(cat /teknisa/route53-migration/name.txt)
for line in ${LIST[@]} ; do
        sed -i "s/teknisa.com/${line}.com.br/g" $line.com.br;
        sed -i "s/teknisa.com/${line}.com/g" $line.com;
        sed -i "s/teknisa.com/${line}.net/g" $line.net;
        sed -i "s/teknisa.com/${line}.net.br/g" $line.net.br;
        sed -i "s/teknisa.com/${line}.eu/g" $line.eu;
        sed -i "s/teknisa.com/${line}.inf.br/g" $line.inf.br;
        sed -i "s/teknisa.com/${line}.org/g" $line.org;
        sed -i "s/teknisa.com/${line}.info/g" $line.info;
done