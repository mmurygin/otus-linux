#!/bin/bash

nice -10 ./nice/fibonacci.py 35 &
nice --10 ./nice/fibonacci.py 35 &

wait
