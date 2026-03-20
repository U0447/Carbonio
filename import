#!/bin/bash
USERPASS="/opt/backups/zmigrate/userpass"
USERDATA="/opt/backups/zmigrate/userdata"
USERS="/opt/backups/zmigrate/emails.txt"
for i in `cat $USERS`
do
givenName=$(grep givenName: $USERDATA/$i.txt | cut -d ":" -f2)
displayName=$(grep displayName: $USERDATA/$i.txt | cut -d ":" -f2)
shadowpass=$(cat $USERPASS/$i.shadow)
zimbraAccountStatus=$(grep zimbraAccountStatus: $USERDATA/$i.txt | cut -d ":" -f2)
zimbraPrefMailForwardingAddress=$(grep zimbraPrefMailForwardingAddress: $USERDATA/$i.txt | cut -d ":" -f2)
tmpPass="CHANGEme"
carbonio prov ca $i CHANGEme cn "$givenName" displayName "$displayName" givenName "$givenName" zimbraPrefMailForwardingAddress "$ zimbraPrefMailForwardingAddress"  
carbonio prov ma $i userPassword "$shadowpass"
carbonio prov ma $i zimbraAccountStatus "$zimbraAccountStatus"
done
