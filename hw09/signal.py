#!/usr/bin/env python

import os, signal, time

def term_handler(signum, frame):
  print("Ok, I'm done. Buy")
  exit(0)

def say_hello(signum, frame):
  print("Hello from USER signal")


signal.signal(signal.SIGTERM, term_handler)
signal.signal(signal.SIGUSR1, say_hello)

print("Run with pid %d" % os.getpid())
print("Say hello with: kill -10 pid")
print("Finish processing: kill -15 pid")

while True:
    print("Working")
    time.sleep(5)
