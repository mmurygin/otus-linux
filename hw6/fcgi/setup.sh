#!/bin/bash

yum install -y epel-release
yum install -y gcc fcgi-devel spawn-fcgi nginx

# build fcgi server
gcc -o /usr/bin/test-server /vagrant/fcgi/test-server.c -lfcgi

# configure spawn-fcgi unit
cp /vagrant/fcgi/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service
cp /vagrant/fcgi/spawn-fcgi.conf /etc/sysconfig/spawn-fcgi
systemctl enable --now spawn-fcgi.service

# configure and run nginx
cp /vagrant/fcgi/nginx.conf /etc/nginx/nginx.conf
systemctl enable --now nginx
