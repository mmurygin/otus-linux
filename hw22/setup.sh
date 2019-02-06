#!/bin/bash

vagrant up
./host/setup-ssh-access.sh
./host/disable-all-if-eth0.sh
