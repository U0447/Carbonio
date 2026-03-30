#!/bin/bash
contador=1
total=$(cat emails.txt | wc -l)

while read -r i; do
echo $contador"/"$total": "$i

do zmmailbox -z -m $i -t 0 getRestURL '/?fmt=tgz' > /opt/backup/migrate/MBOX&/$i.tgz

((contador++))
done < emails.txt
