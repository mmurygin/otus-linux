#!/bin/bash

yum install -y epel-release

yum install -y gcc gcc-c++ autoconf automake fcgi-devel spawn-fcgi

gcc -o /usr/bin/test-server /vagrant/fcgi/test-server.c -lfcgi

spawn-fcgi -p 3000 -f /usr/bin/test-server
