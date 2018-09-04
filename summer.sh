#!/bin/bash
echo "Skriv inn tall du ønsker å summere og trykk ctrl+d når du er ferdig:"
declare -i sum=0
declare -i number
while read number 
do 
(( sum+=number ))
done
echo "Summen er $sum"

