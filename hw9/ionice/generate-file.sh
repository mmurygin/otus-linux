#!/bin/bash

filename="$(uuidgen).txt"
run_params=$(ionice -p $$)

echo "Generating 1G with params (${run_params})"

START=$(date +%s.%N)

dd if=/dev/zero of="$filename" count=1048576 bs=1024
rm "$filename"

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo "Running time of command with params (${run_params}): ${DIFF} seconds"
