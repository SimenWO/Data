#!/bin/bash

declare -i tidsintervall

filnavn=$1
tidsintervall=$2
finnes=false 
filinfo=`stat -c %Y $filnavn`

if [ -f $filnavn ] 
then
echo "Filen finnes allerede"
finnes=true
fi

while [ true ]
do

if [ -f $filnavn ] && [ ! $finnes = true ]
then 
echo "Filen $filnavn ble opprettet"
filinfo=`stat -c %Y $filnavn`
finnes=true
exit 0
fi

if [ -f $filnavn ] && [ ! $filinfo == `stat -c %Y $filnavn` ]
then
echo "Filen $filnavn ble endret" 
filinfo=`stat -c %Y $filnavn`
finnes=true
exit 0
fi

if [ ! -f $filnavn ] && [$finnes = true ]
then 
echo "Filen $filnavn ble slettet"
finnes=false
exit 0
fi

sleep $tidsintervall

done
