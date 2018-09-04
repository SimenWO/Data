#!/bin/bash

while true
do
for f in "$@"
do
./filkontroll.sh $f 5 & sleep 1m
done
done

