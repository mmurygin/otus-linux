#!/bin/bash

declare -r LOG_FILE_NAME=/var/log/log-processor.log

function get_current_date() {
  date +"%b %d %H:%M:%S"
}

if [[ -e "$LOG_FILE_NAME" ]]; then
  from_date=$(tail -1 "$LOG_FILE_NAME" | sed 's_\[\(.*\)\] Processng logs_\1_')
fi

to_date=$(get_current_date)

echo "[$to_date] Processing Logs" >> "$LOG_FILE_NAME"

echo "Report from $from_date to $to_date"

echo "The more frequent IP addresses: "
/vagrant/scripts/print-source-ips.sh

echo "Return codes: "
/vagrant/scripts/print-status-codes.sh

echo "Errors:"
/vagrant/scripts/print-errors.sh
