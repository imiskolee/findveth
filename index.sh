#!/bin/sh

baseDir="findveth_dumps"
mkdir $baseDir
rule=$1;

if=`ifconfig  | grep "veth*" | awk -F ':' '{print $1}'`;
for ni in $if
do
`tcpdump -i $ni $rule > $baseDir/$ni.log &`
done
watch -n 1 -d 'ls -l $baseDir'

