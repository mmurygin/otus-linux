#!/bin/bash

# cp /vagrant/parse-and-send-logs.sh /etc/cron.hourly/

# uncomment for testing
sed -i 's/MAILTO=root/MAILTO=muriginm@gmail.com/' /etc/crontab

echo "* * * * * root /vagrant/scripts/solo.sh /vagrant/scripts/process-logs.sh" >> /etc/crontab
echo "" >> /etc/crontab
