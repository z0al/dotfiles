{
  programs = {
    bash.interactiveShellInit = ''
      # https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      # https://github.com/LnL7/nix-darwin#install
      if test -e /etc/static/bashrc;
        then . /etc/static/bashrc;
      fi
    '';

    zsh.interactiveShellInit = ''
      # https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      # https://github.com/LnL7/nix-darwin#install
      if test -e /etc/static/zshrc;
        then . /etc/static/zshrc;
      fi
    '';

    fish.interactiveShellInit = ''
      # https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos
      if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh';
        fenv source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      end

      # https://github.com/LnL7/nix-darwin#install
      if test -e /etc/static/fish/config.fish;
        source /etc/static/fish/config.fish;
      end
    '';
  };
}
