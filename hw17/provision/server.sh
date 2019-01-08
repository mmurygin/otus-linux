#!/bin/bash

source /vagrant/provision/helpers.sh

gateway="$1"

allow_ssh_access
setup_connectivity "System eth1" "$gateway"
