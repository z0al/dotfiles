# dotfiles

## Getting started

**1. Clone this repository:**

```sh
$ git clone https://github.com/ahmed-taj/dotfiles.git
```

**2. Run the installation script**

This will create symlinks from this repo to your home folder.

```sh
$ ./install.sh
```

> **Caution:** The script will override existing files (e.g. .bashrc, .bash_profile ..etc)

## Customization

Add your aliases, env vars ..etc to `.extra` file that looks something like this:

```sh
#!/bin/sh

export SOMETHING="somevalue"
``` 

## License

This project is licensed under the terms of the MIT license. See [LICENSE](./LICENSE).