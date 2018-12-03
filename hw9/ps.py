#!/usr/bin/env python

import glob
import os

users = dict()
format_str = "{:<8.8} {:>5} {:>4} {:>4} {:>10} {:>8} {:<8} {:<5} {:<5} {:<5} {:<.40}"


def get_processes():
    return [os.path.basename(f) for f in glob.glob('/proc/[0-9]*')]


def read_proc_pid_file(pid, filename):
    path = '/proc/%s/%s' % (pid, filename)
    with open(path, 'r') as fp:
        lines = fp.readlines()

    return lines

def init_users():
    with open('/etc/passwd', 'r') as fp:
        for line in fp.readlines():
            user_params = line.split(':')
            id = user_params[2]
            login = user_params[0]
            users[id] = login

def get_user_name(user_id):
    if len(users) == 0:
        init_users()

    return users[user_id]


def get_value_from_status_rows(key, status_rows):
    value_str = [x for x in status_rows if x.startswith('%s:' % key)][0]

    sep_index = value_str.index(':')

    return value_str[sep_index + 1:].strip()

def get_cmd(pid, status_rows):
    cmdline_rows = read_proc_pid_file(pid, 'cmdline')

    if len(cmdline_rows) > 0:
        return cmdline_rows[0]

    name_str = get_value_from_status_rows('Name', status_rows)
    name = name_str.split('/')[0]

    return "[%s]" % name

def print_process(pid):
    stat = read_proc_pid_file(pid, 'stat')[0].split()
    status = read_proc_pid_file(pid, 'status')

    cmd = get_cmd(pid, status)

    uid = get_value_from_status_rows('Uid', status).split()[0]
    ulogin = get_user_name(uid)

    time = int(stat[13]) + int(stat[14])

    print(format_str.format(
        ulogin,
        pid,
        'data',
        'data',
        stat[22],
        stat[23],
        stat[6],
        stat[2],
        'data',
        time,
        cmd,
    ))


def print_processes(procceses):
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
        print_process(pid)


def main():
    processes = get_processes()
    print_processes(processes)

if __name__ == "__main__":
    main()
