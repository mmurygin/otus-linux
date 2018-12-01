#!/bin/bash

class="$1"
priority="$2"

START=$(date +%s.%N)

ionice -c "$class" -n "$priority" dd if=/dev/zero of="$(uuidgen).txt" count=2048576 bs=1024

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo "Running time of command with class ${class} and priority ${priority} ${DIFF} seconds"
