#!/bin/bash
contador=1
total=$(cat emails.txt | wc -l)

for email in `cat /opt/backups/zmigrate/emails.txt`
do 
echo $contador"/"$total": "$email
zmmailbox -z -m $email -t 0 postRestURL "/?fmt=tgz&resolve=skip" /opt/backups/zmigrate/MBOX/$email.tgz
((contador++))

done
