#/bin/bash
declare -a IPS=(111.111.111.111 111.111.111.111)
CONFIG_FILE=inventory/local/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

#ansible-playbook -i inventory/local/hosts.yaml -u root cluster.yml
