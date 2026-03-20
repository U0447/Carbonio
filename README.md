# Carbonio
Zimbra to carbonio scripts

Based on https://community.zextras.com/how-to-use-script-to-migrate-zimbra-to-carbonio-carbonio-ce/

Export
#!/bin/bash
while read -r i; do
echo "$i"
out="$(z mprov -l ga $i |grep -Ei '(userPassword|Name:|zimbraAccountStatus:|zimbraPrefMailForwardingAddress:)')"
awk '/^userPassword: / {print $2}' <<< "$out" > "userpass/$i.shadow"
awk '!/^userPassword: /' <<< "$out" > "userdata/$i.txt"
done < emails.txt


Import
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
