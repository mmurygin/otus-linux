#!/bin/bash

yum install -y epel-release
yum install -y gcc fcgi-devel spawn-fcgi nginx

# build and run fcgi server
gcc -o /usr/bin/test-server /vagrant/fcgi/test-server.c -lfcgi
spawn-fcgi -p 9000 -f /usr/bin/test-server

# configure and run nginx
cp /vagrant/fcgi/nginx.conf /etc/nginx/nginx.conf
systemctl enable --now nginx
