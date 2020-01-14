#!/usr/bin/env python

import sys
import string
import re
import argparse
import subprocess

def VTEversion(string):
    if re.match(r'\d+', string):
        return string


parser = argparse.ArgumentParser(description='Auto diff VTE differences.log')
parser.add_argument('--rev', dest='revision', required=True, type=VTEversion,
                    help='indicate VTE revision to diff')
parser.add_argument('--from', dest='fromNum', type=int,
                    help='indicate from witch file number to start diff')
args = parser.parse_args()

count = 0
in_file = open("vte_updater/" + args.revision + "/differences.log", "r")
while True:
    count += 1
    in_line = in_file.readline()
    if in_line == "":
        break
    if count < args.fromNum:
        continue
    in_line = in_line[2:-1]
    if raw_input("Proceed with next file ([{}] {})? [y]/n: ".format(count, in_line)).lower() in ('y', 'yes', ''):
        subprocess.call(['vimdiff', in_line, 'vte_updater/' + args.revision + '/backup/vte/' + in_line])
in_file.close()

