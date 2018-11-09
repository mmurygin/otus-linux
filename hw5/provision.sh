#!/bin/bash

sed -i 's/MAILTO=root/MAILTO=muriginm@gmail.com/' /etc/crontab

echo "* * * * * root /vagrant/solo.sh /vagrant/process-logs.sh" >> /etc/crontab
echo ""
