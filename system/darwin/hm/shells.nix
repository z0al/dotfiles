{ lib, user, ... }:

let
  # https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos
  nixDaemon = "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh";

  # https://brew.sh
  initBrew = ''eval "$(/opt/homebrew/bin/brew shellenv)"'';
in

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
      if [ -e '${nixDaemon}' ]; then
        . '${nixDaemon}'
      fi

      # https://github.com/LnL7/nix-darwin#install
      if test -e /etc/static/zshrc; then
        . /etc/static/zshrc;
      fi

      # Homebrew
      if test -e /opt/homebrew/bin/brew; then
        ${initBrew};
      fi
    '';

    fish.interactiveShellInit = ''
      if test -e '${nixDaemon}';
        fenv source '${nixDaemon}'
      end

      # https://github.com/LnL7/nix-darwin#install
      if test -e /etc/static/fish/config.fish;
        source /etc/static/fish/config.fish;
      end

      # Homebrew
      if test -e /opt/homebrew/bin/brew;
        ${initBrew};
      end
    '';
  };
}
