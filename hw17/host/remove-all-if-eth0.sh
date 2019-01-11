#!/bin/bash

private_key="${HOME}/.vagrant.d/insecure_private_key"

ssh -i "$private_key" -p 8001 vagrant@127.0.0.1 bash /vagrant/guest/remove-if-eth0.sh
ssh -i "$private_key" -p 8002 vagrant@127.0.0.1 bash /vagrant/guest/remove-if-eth0.sh
ssh -i "$private_key" -p 8003 vagrant@127.0.0.1 bash /vagrant/guest/remove-if-eth0.sh
ssh -i "$private_key" -p 8004 vagrant@127.0.0.1 bash /vagrant/guest/remove-if-eth0.sh
ssh -i "$private_key" -p 8005 vagrant@127.0.0.1 bash /vagrant/guest/remove-if-eth0.sh
ssh -i "$private_key" -p 8006 vagrant@127.0.0.1 bash /vagrant/guest/remove-if-eth0.sh

