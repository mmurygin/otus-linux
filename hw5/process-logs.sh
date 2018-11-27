#!/bin/bash

from_date=$(grep "$0" < /var/log/cron | tail -1 | awk '{print $1 " " $2 " " $3}')
to_date=$(date +"%b %d %H:%M:%S")

echo "Report from $from_date to $to_date"

echo "Some data..."
