#!/bin/bash

source /vagrant/provision/helpers.sh

allow_system_routing

iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE

nmcli connection modify "System eth1" ipv4.routes "192.168.0.0/16 192.168.255.2"
nmcli connection up "System eth1"
