#!/bin/bash

yum install -y httpd

sed -i '/Listen 80/d' /etc/httpd/conf/httpd.conf

cp /vagrant/httpd/httpd@.service /etc/systemd/system
cp /vagrant/httpd/template.conf /etc/httpd/conf.d/template.conf
cp /vagrant/httpd/test-configs/httpd{1,2} /etc/sysconfig
