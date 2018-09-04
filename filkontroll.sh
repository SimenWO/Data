#!/bin/bash
filnavn=$1
tidsintervall=$2

gyldig=1
if [ -f $filnavn ]
then
echo "filen er allerede opprettet"
filtid=`stat $filnavn -c %Y`
while(( gyldig=1 ))
do
sleep $tidsintervall

if [ ! -f $filnavn  ]
then
echo "$filnavn har blitt slettet"
gyldig=0
exit 0
fi

filtid2=`stat $filnavn -c %Y`
if [[ ! filtid -eq filtid2 ]]
then
echo "$filnavn har blitt endret"
break
fi
done

else

while(( gyldig ))
do
sleep $tidsintervall
if [ ! -f $filnavn ]
then
echo "filen $filnavn finnes ikke"

else
echo "filen $filnavn har blitt opprett"
gyldig=0
fi
done
fi

