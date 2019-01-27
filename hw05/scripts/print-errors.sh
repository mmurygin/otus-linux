#!/bin/bash

ERROR_LOG="$1"

sed -nr 's/.*\[error\] [0-9]{1,10}#[0-9]{1,5}: \*[0-9]{1,10}(.*)\, client.*/\1/p' "$ERROR_LOG"
