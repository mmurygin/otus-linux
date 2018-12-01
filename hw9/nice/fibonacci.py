#!/usr/bin/env python

import sys

def fibonacci(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci(n-1)+fibonacci(n-2)

if len(sys.argv) != 2:
    print("Argument error. Usage: ./fibonacci.py n")
    exit(1)

n = int(sys.argv[1])
print("Calculating fibonacci for n = %s" % n)

res = fibonacci(n)

print("Result = %s" % res)
