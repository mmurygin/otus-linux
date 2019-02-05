#!/bin/bash

echo Please enter your sudo password to allow assymetric routing
sudo sysctl -w net.ipv4.conf.all.rp_filter=2
