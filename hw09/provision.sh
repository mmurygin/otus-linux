#!/bin/bash

# fix locale problem
echo "export LC_ALL=en_US.utf-8" >> /etc/profile.d/locale.sh
echo "export LANG=en_US.utf-8" >> /etc/profile.d/locale.sh
mandb

yum install -y bc
echo 'cfq' > /sys/block/sda/queue/scheduler
