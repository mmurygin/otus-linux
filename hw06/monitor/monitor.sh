#!/bin/bash

if [[ ! "$FILE" ]]; then
    echo "Please provide filename" >&2
    exit 1
fi

if [[ ! "$KEY_WORD" ]]; then
    echo "Please provide key word" >&2
fi

echo "Searching ${KEY_WORD} in ${FILE}"

grep "$KEY_WORD" "$FILE"
