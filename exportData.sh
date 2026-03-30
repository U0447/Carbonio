#!/bin/bash
contador=1
total=$(cat emails.txt | wc -l)

for email in `cat /opt/backups/migrate/emails.txt`
do 
echo $contador"/"$total": "$email
zmmailbox -z -m $email -t 0 getRestURL '/?fmt=tgz' > /opt/backups/migrate/MBOX/$email.tgz 
((contador++))

done
