#!/bin/bash

./ionice/generate-file-with-ionice.sh 2 7 &
./ionice/generate-file-with-ionice.sh 2 0 &

wait
