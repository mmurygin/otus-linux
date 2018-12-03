#!/bin/bash

cp /vagrant/monitor/monitor.sh /usr/bin/monitor.sh
cp /vagrant/monitor/monitor.service /etc/systemd/system/monitor.service
cp /vagrant/monitor/monitor.timer /etc/systemd/system/monitor.timer
cp /vagrant/monitor/monitor.conf /etc/sysconfig/monitor

systemctl enable --now monitor.timer
