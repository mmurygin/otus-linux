#!/bin/bash

/vagrant/rename-vg.sh
/vagrant/dracut/add-module.sh

systemctl reboot -f
