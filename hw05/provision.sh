#!/bin/bash

yum install -y mailx

cp /vagrant/scripts/parse-and-send-logs.sh /etc/cron.hourly/
