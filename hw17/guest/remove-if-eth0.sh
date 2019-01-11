#!/bin/bash

sudo nmcli device disconnect eth0
sudo nmcli connection delete "System eth0"
