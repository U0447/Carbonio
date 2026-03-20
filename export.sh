#!/bin/bash
while read -r i; do
echo "$i"

out="$(z mprov -l ga $i |grep -Ei '(userPassword|Name:|zimbraAccountStatus:|zimbraPrefMailForwardingAddress:)')"

awk '/^userPassword: / {print $2}' <<< "$out" > "userpass/$i.shadow"
awk '!/^userPassword: /' <<< "$out" > "userdata/$i.txt"

done < emails.txt
