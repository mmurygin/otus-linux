#!/bin/bash

declare -r ACCESS_LOG="$1"

declare -A urls
for url in $(sed -nr 's/.*\"[A-Z]{3,8} (.*) HTTP.*/\1/p' "$ACCESS_LOG"); do
    if [[ ${urls["$url"]+_} ]]; then
        ((++urls["$url"]))
    else
        urls["$url"]=1
    fi
done

TMP_RESULT=$(mktemp)

for url in "${!urls[@]}"; do
    echo "[${url}] ${urls["$url"]}" >> "$TMP_RESULT"
done

sort -rnk 2 "$TMP_RESULT" | sed -ne "1,${TOP_REQUEST_URLS}p"
rm "$TMP_RESULT"
