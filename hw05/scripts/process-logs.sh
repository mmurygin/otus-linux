#!/bin/bash

declare -r TMP_ACCESS="$(mktemp)"
declare -r TMP_ERROR="$(mktemp)"

if [[ -e "$RUN_LOG" ]]; then
    from_date=$(sed -rn 's/Last run: (.*)/\1/p' "$RUN_LOG")

    access_line_processed=$(sed -rn 's/Access lines processed: ([0-9]+)/\1/p' "$RUN_LOG")
    error_lines_processed=$(sed -rn 's/Error lines processed: ([0-9]+)/\1/p' "$RUN_LOG")
fi

if [[ ! $from_date ]]; then
    from_date="service first start"
fi

if [[ $access_line_processed ]]; then
    sed -e "1,${access_line_processed}d" "$ACCESS_LOG" > "$TMP_ACCESS"
else
    cp "$ACCESS_LOG" "$TMP_ACCESS"
fi

if [[ $error_lines_processed ]]; then
    sed -e "1,${error_lines_processed}d" "$ERROR_LOG" > "$TMP_ERROR"
else
    cp "$ERROR_LOG" "$TMP_ERROR"
fi

to_date=$(date +"%b %d %H:%M:%S")

echo "Report from $from_date to $to_date"
echo

echo "The most frequent IP addresses: "
/vagrant/scripts/print-source-ips.sh "$TMP_ACCESS" "$TMP_ERROR"
echo

echo "The most frequent URLs:"
/vagrant/scripts/print-urls.sh "$TMP_ACCESS"
echo

echo "Errors:"
/vagrant/scripts/print-errors.sh "$TMP_ERROR"
echo

echo "Return codes: "
/vagrant/scripts/print-status-codes.sh "$TMP_ACCESS"
echo

cat > "$RUN_LOG" <<EOF
Last run: $to_date
Access lines processed: $(wc -l $ACCESS_LOG | cut -d" " -f1)
Error lines processed: $(wc -l $ERROR_LOG | cut -d" " -f1)
EOF

rm -f "$TMP_ACCESS"
rm -f "$TMP_ERROR"
