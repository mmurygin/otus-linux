#!/usr/bin/env python

import glob
import os

def get_processes():
  return [os.path.basename(f) for f in glob.glob('/proc/[0-9]*')]

procceses = get_processes()

format_str = "{:<6} {:>5} {:>4} {:>4} {:>8} {:>8} {:<8} {:<5} {:<5} {:<5} {:}"

print(format_str.format(
  'USER',
  'PID',
  '%CPU',
  "%MEM",
  'VSZ',
  'RSS',
  'TTY',
  'STAT',
  'START',
  'TIME',
  'COMMAND'
))

for pid in get_processes():
  cmdline = open('/proc/%s/cmdline' % pid, 'r').readline()
  print(format_str.format(
    'user',
    pid,
    pid,
    pid,
    pid,
    pid,
    pid,
    pid,
    pid,
    pid,
    cmdline,
  ))

