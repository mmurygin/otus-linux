#!/bin/bash

# fix locale problem
echo "export LC_ALL=en_US.utf-8" >> /etc/profile.d/locale.sh
echo "export LANG=en_US.utf-8" >> /etc/profile.d/locale.sh

# install dependencies
yum update -y
yum install -y epel-release
yum install -y httpd spawn-fcgi

/vagrant/monitor/setup.sh
