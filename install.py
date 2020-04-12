#!/usr/bin/python3

import os
import subprocess
from pathlib import Path


END = '\033[0m'
GREEN = '\033[32m'
RED = '\033[91m'
DIM = '\033[2m'


def log(*str):
    print('  ', *str)


def fail(*str):
    print('    ', RED, *str, END)


def run(command):
    try:
        r = subprocess.run(
            command,
            check=True,
            stderr=subprocess.PIPE,
            stdout=subprocess.PIPE,
            universal_newlines=True
        )
        return r.stdout
    except Exception as error:
        fail('failed with the following error:', '\n')

        if isinstance(error, subprocess.CalledProcessError):
            # pylint: disable=no-member
            fail('  ', error.stderr)
        else:
            fail('  ', error)

        exit(1)


dotfiles = Path.home().joinpath('.dotfiles')


def install():
    executable = 'install.sh'

    log(DIM, 'Running', END, 'apt update')
    run(['sudo', 'apt-get', '-y', 'update'])

    # runs every install.sh script in this repository
    for (root, _, files) in os.walk(dotfiles):
        has_installer = True if executable in files else False

        if has_installer:
            installer = Path(root).joinpath(executable)
            name = installer.relative_to(dotfiles)

            log(DIM, 'Running', END, name)
            run(str(installer))


if __name__ == '__main__':
    print()
    install()
    print()
    print('done')
