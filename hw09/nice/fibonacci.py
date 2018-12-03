#!/usr/bin/env python

import sys
import os
from timeit import default_timer as timer

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
nice = os.nice(0)
print("Calculating fibonacci for n = %d with nice = %d" % (n, nice))

start = timer()
res = fibonacci(n)
end = timer()

print("Execution time with nice %d: %f s" % (nice, (end - start)))
