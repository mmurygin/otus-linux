#!/bin/bash

ionice -c 2 -n 7 ./ionice/generate-file.sh &
ionice -c 2 -n 0 ./ionice/generate-file.sh &

wait
