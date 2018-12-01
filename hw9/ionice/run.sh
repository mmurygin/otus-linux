#!/bin/bash

./ionice/generate-file-with-ionice.sh 2 7 &
./ionice/generate-file-with-ionice.sh 1 0 &

wait
