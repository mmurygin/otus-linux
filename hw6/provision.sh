#!/bin/bash

# fix locale problem
echo "export LC_ALL=en_US.utf-8" >> /etc/profile.d/locale.sh
echo "export LANG=en_US.utf-8" >> /etc/profile.d/locale.sh

yum update -y

# /vagrant/monitor/setup.sh
/vagrant/fcgi/setup.sh
# /vagrant/httpd/setup.sh

