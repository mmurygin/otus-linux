#!/bin/bash

source /vagrant/config.ini
export $(cut -d= -f1 /vagrant/config.ini)

/vagrant/scripts/solo.sh /vagrant/scripts/process-logs.sh | mail -s "Logs report" "$MAILTO"
