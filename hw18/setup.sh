#!/bin/bash

vagrant up
./host/setup-ssh-tunnels.sh
./host/disable-all-if-eth0.sh
