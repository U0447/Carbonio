#!/bin/bash
USERPASS="/opt/backups/zmigrate/userpass"
USERDATA="/opt/backups/zmigrate/userdata"
USERS="/opt/backups/zmigrate/emails.txt"
TOTAL=$(cat "/opt/backups/zmigrate/emails.txt"| wc -l)
COUNTER=1

for i in `cat $USERS`
do
echo $COUNTER"/"$TOTAL" : "$I
givenName=$(grep givenName: $USERDATA/$i.txt | cut -d ":" -f2)
displayName=$(grep displayName: $USERDATA/$i.txt | cut -d ":" -f2)
shadowpass=$(cat $USERPASS/$i.shadow)
zimbraAccountStatus=$(grep zimbraAccountStatus: $USERDATA/$i.txt | cut -d ":" -f2)
zimbraPrefMailForwardingAddress=$(grep zimbraPrefMailForwardingAddress: $USERDATA/$i.txt | cut -d ":" -f2)
tmpPass="CHANGEme"
carbonio prov ca $i CHANGEme cn "$givenName" displayName "$displayName" givenName "$givenName" zimbraPrefMailForwardingAddress "$ zimbraPrefMailForwardingAddress"  
carbonio prov ma $i userPassword "$shadowpass"
carbonio prov ma $i zimbraAccountStatus "$zimbraAccountStatus"
((COUNTER++))
done
