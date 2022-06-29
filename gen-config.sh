#!/usr/bin/env bash
declare -a IPS=(167.172.42.3 146.190.234.64 164.92.144.48 )
CONFIG_FILE=inventory/local/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

#ansible-playbook -i inventory/local/hosts.yaml -u root cluster.yml
