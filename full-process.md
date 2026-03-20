Step-1
mkdir -p /opt/backups/zmigrate
chown -R zimbra:zimbra /opt/backups/zmigrate
cd /opt/backups/zmigrate

zmprov -l gad > domains.txt
zmprov -l gaa > emails.txt

mkdir userpass
mkdir userdata

run export.sh
