#!/bin/bash

if [[ ! "$FILE_NAME" ]]; then
    echo "Please provide filename"
    exit 1
fi

if [[ ! "$KEY_WORD" ]]; then
    echo "Please provide key word"
fi

grep "$KEY_WORD" "$FILE_NAME"
