#!/bin/bash

CREDS_FILE="../creds.txt"
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"
IPS="decalre -a IPS=("
#copy ssh keys  and print ips
while IFS="" read -r LINE || [ -n "$LINE" ]
do
    if [ ! -z "${LINE}" ]; then
        USER=$((awk '{print $5}'  <<< $LINE)| cut -d'@' -f1)
        IP=$((awk '{print $5}'  <<< $LINE)| cut -d'@' -f2)
        PASS=$(awk '{print $7}' <<< $LINE)
        echo "sshpass -p $PASS ssh-copy-id $USER@$IP"
        IPS="${IPS}$IP "
    fi        
done < "$SCRIPT_DIR/$CREDS_FILE"

echo "$IPS)"
