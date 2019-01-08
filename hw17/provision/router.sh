#!/bin/bash

source /vagrant/provision/helpers.sh

connection="$1"
gateway="$2"

allow_ssh_access
allow_system_routing
setup_connectivity "$connection" "$gateway"
