#!/bin/bash

yum install -y httpd

# apache could not listen to some ports when enforcing is true
# set permissive mode
setenforce 0

# remove default port. We will provide port in config file
sed -i '/Listen 80/d' /etc/httpd/conf/httpd.conf

cp /vagrant/httpd/httpd@.service /etc/systemd/system
cp /vagrant/httpd/template.conf /etc/httpd/conf.d/template.conf
cp /vagrant/httpd/test-configs/httpd{1,2} /etc/sysconfig

systemctl enable --now httpd@httpd1.service
systemctl enable --now httpd@httpd2.service
