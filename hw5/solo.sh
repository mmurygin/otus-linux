#!/bin/bash

script="$1"
encoded_name=$(sed 's|/|_|g' <<< "$script")

export LOCK=/var/lock/"$encoded_name"

if [[ -f $LOCK ]]; then
    echo "$script" is already running!
    exit 6
fi

trap 'rm -f "$LOCK"; exit $?;' INT TERM EXIT

touch "$LOCK"

$script

rm -f "$LOCK"
trap - INT TERM EXIT
