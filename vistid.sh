#!/bin/bash

filnavn=$1
echo "Skriv inn en hendelse <enter>"
read k
cat $filnavn | while read line; do

grep "$k" | awk '{sum += $2} END {print sum}'

done
