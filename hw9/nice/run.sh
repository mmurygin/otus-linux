#!/bin/bash

nice -19 ./nice/fibonacci.py 35 &
nice --20 ./nice/fibonacci.py 35 &

wait
