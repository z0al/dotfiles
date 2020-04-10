#!/usr/bin/python3

import os, subprocess
from pathlib import Path

END = '\033[0m'
GREEN = '\033[32m'
RED = '\033[91m'
DIM = '\033[2m'


def log(*str):
    print('  ', *str)


def ok(*str):
    print('    ', GREEN + '✔️' + END, DIM, *str, END)


def error(*str):
    print('    ', RED + '✘ ', *str, END)
    exit(1)


def link_file(src, dist):
    src = str(src)
    dist = str(dist)

    if os.path.exists(dist):
        if os.readlink(dist) == src:
            ok('skipped', src)
            return
        else:
            backup = dist + ".backup"
            os.rename(dist, backup)
            ok('moved', dist, 'to', backup)

    os.symlink(src, dist)
    ok('linked', src, dist)


def exec(cmd, args, out=subprocess.STDOUT):
    script = [cmd, *args]
    r = subprocess.run(script, stdout=out)

    if r.returncode > 0:
        exit(r.returncode)


home = Path.home()
dotfiles = Path(os.path.dirname(os.path.realpath(__file__)))


def setup_zsh():
    log('setting up plugins')
    plugins_path = dotfiles.joinpath('zsh/plugins.txt')
    output_path = home.joinpath('.zsh_plugins.sh')

    with open(plugins_path, 'r') as plugins:
        with open(output_path, 'w') as out:
            exec('antibody', ['bundle', plugins.read()], out)

    ok('downloaded plugins to', output_path)
    print()


def setup_starship():
    log('setting up starship')
    config_path = dotfiles.joinpath('starship', 'config.toml')
    dist_path = home.joinpath('.config', 'starship.toml')

    # makes sure ~/.config exists
    home.joinpath('.config').mkdir(exist_ok=True)

    link_file(config_path, dist_path)
    print()


def setup_dotfiles():
    log('linking dotfiles')

    ext = '.symlink'
    for (root, _, files) in os.walk(dotfiles):
        symlinks = [name for name in files if name.endswith(ext)]

        for link in symlinks:
            src = Path(root).joinpath(link)
            dist = home.joinpath(link.rstrip(ext))

            link_file(src, dist)
    print()


if __name__ == '__main__':
    print()
    setup_zsh()
    setup_starship()
    setup_dotfiles()

    print('done')
