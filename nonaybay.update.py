#!/usr/bin/python3

import os
import sys
import time


options_list = [
    '--assume-yes --allow-downgrades --fix-broken --fix-missing --fix-policy --no-install-recommends --no-install-suggests --show-progress --verbose-versions',
    '--allow-insecure-repositories --list-cleanup',
]

commandlist = [
    'update {}'.format(options_list[1]),
    'upgrade {}'.format(options_list[0]),
    'full-upgrade {}'.format(options_list[0]),
    'dist-upgrade {}'.format(options_list[0]),
    'autoremove {}'.format(options_list[0]),
    'clean',
]


def clean_screen():
    os.system('clear')


if (len(sys.argv) > 1):
    arglist = sys.argv[1:]

    for package in arglist:
        commandlist.insert(1, 'install {} {}'.format(package, options_list[0]))


for command in commandlist:
    clean_screen()
    print('{}\n'.format(command))
    os.system('sudo apt-get {}'.format(command))
    time.sleep(3)
