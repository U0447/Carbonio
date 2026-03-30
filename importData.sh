#!/bin/bash
contador=1
total=$(cat emails.txt | wc -l)

while read -r i; do
echo $contador"/"$total": "$i

do zmmailbox -z -m $i -t 0 postRestURL "/?fmt=tgz&resolve=skip" /opt/backups/zmigrate/MBOX/$i.tgz

((contador++))
done < emails.txt
