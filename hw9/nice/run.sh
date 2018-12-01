#!/bin/bash

time nice -19 ./nice/fibonacci.py 30 &
time nice --20 ./nice/fibonacci.py 30 &

echo "Done!"
