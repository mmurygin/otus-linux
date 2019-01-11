#!/bin/bash

private_key="${HOME}/.vagrant.d/insecure_private_key"
ssh_options="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

ssh -i "$private_key" $ssh_options -p 8001 vagrant@127.0.0.1 /vagrant/guest/disable-if-eth0.sh
ssh -i "$private_key" $ssh_options -p 8002 vagrant@127.0.0.1 /vagrant/guest/disable-if-eth0.sh
ssh -i "$private_key" $ssh_options -p 8003 vagrant@127.0.0.1 /vagrant/guest/disable-if-eth0.sh
ssh -i "$private_key" $ssh_options -p 8004 vagrant@127.0.0.1 /vagrant/guest/disable-if-eth0.sh
ssh -i "$private_key" $ssh_options -p 8005 vagrant@127.0.0.1 /vagrant/guest/disable-if-eth0.sh
ssh -i "$private_key" $ssh_options -p 8006 vagrant@127.0.0.1 /vagrant/guest/disable-if-eth0.sh
