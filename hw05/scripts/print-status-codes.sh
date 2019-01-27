#!/bin/bash

declare -r ACCESS_LOG="$1"

declare -A codes
for code in $(sed -nr 's/.*HTTP\/[12]\.[01]" ([0-9]{3}).*/\1/p' "$ACCESS_LOG"); do
    if [[ ${codes["$code"]+_} ]]; then
        ((++codes["$code"]))
    else
        codes["$code"]=1
    fi
done

TMP_RESULT=$(mktemp)

for code in "${!codes[@]}"; do
    echo [${code}]: ${codes["$code"]} >> "$TMP_RESULT"
done

sort -nrk 2 "$TMP_RESULT"

rm "$TMP_RESULT"
