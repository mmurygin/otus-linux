#!/bin/bash

class="$1"
priority="$2"
filename="$(uuidgen).txt"

START=$(date +%s.%N)

ionice -c "$class" -n "$priority" -t dd if=/dev/zero of="$filename" count=2048576 bs=1024
rm "$filename"

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo "Running time of command with class ${class} and priority ${priority}: ${DIFF} seconds"
