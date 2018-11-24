#!/bin/bash

# fix locale problem
echo "export LC_ALL=en_US.utf-8" >> /etc/profile.d/locale.sh
echo "export LANG=en_US.utf-8" >> /etc/profile.d/locale.sh

yum update -y
yum install -y vim

# we could not listen to some ports when enforcing is true
# set permissive mode
setenforce 0

# /vagrant/monitor/setup.sh
/vagrant/fcgi/setup.sh
# /vagrant/httpd/setup.sh

