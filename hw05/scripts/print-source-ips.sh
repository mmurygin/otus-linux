#!/bin/bash

declare -r ACCESS_LOG="$1"
declare -r ERROR_LOG="$2"

declare -A ips
for ip in $(grep -oP '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' "$ACCESS_LOG"); do
    if [[ ${ips["$ip"]+_} ]]; then
        ((++ips["$ip"]))
    else
        ips["$ip"]=1
    fi
done

for ip in $(sed -nr 's/.*client: ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).*/\1/p' \
    "$ERROR_LOG"); do
    if [[ ${ips["$ip"]+_} ]]; then
        ((++ips["$ip"]))
    else
        ips["$ip"]=1
    fi
done

for ip in "${!ips[@]}"; do
    echo ${ip}: ${ips["$ip"]}
done
