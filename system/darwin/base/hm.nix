{ lib, user, ... }:

{
  # Change the default shell to fish
  home.activation = {
    setDefaultShell = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [[ "$SHELL" != *fish ]]
      then
        $DRY_RUN_CMD /usr/bin/chsh -s /run/current-system/sw/bin/fish
      fi
    '';
  };

  programs = {
    zsh.initExtra = ''
      # https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      # https://github.com/LnL7/nix-darwin#install
      if test -e /etc/static/zshrc; then
        . /etc/static/zshrc;
      fi

      # Homebrew
      if test -e /opt/homebrew/bin/brew; then
        eval "$(/opt/homebrew/bin/brew shellenv)";
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

      # Homebrew
      if test -e /opt/homebrew/bin/brew;
        eval "$(/opt/homebrew/bin/brew shellenv)";
      end
    '';
  };
}
