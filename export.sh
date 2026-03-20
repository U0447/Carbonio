#!/bin/bash

TOTAL=$(cat "/opt/backups/zmigrate/emails.txt"| wc -l)
COUNTER=1

while read -r i; do
echo "$i"

echo $COUNTER"/"$TOTAL" : "$I
out="$(z mprov -l ga $i |grep -Ei '(userPassword|Name:|zimbraAccountStatus:|zimbraPrefMailForwardingAddress:)')"

awk '/^userPassword: / {print $2}' <<< "$out" > "userpass/$i.shadow"
awk '!/^userPassword: /' <<< "$out" > "userdata/$i.txt"

((COUNTER++))
done < emails.txt


