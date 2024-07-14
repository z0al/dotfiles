{ lib, ... }:

let
  # https://brew.sh
  initBrew = ''eval "$(/opt/homebrew/bin/brew shellenv)"'';
in

{
  d.shell.sources = [
    # https://nixos.org/manual/nix/stable/installation/installing-binary.html#macos
    "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"

    # https://github.com/LnL7/nix-darwin#install
    "/etc/static/fish/config.fish"
  ];

  programs = {
    fish.interactiveShellInit = ''
      # Homebrew
      if test -e /opt/homebrew/bin/brew;
        ${initBrew};
      end
    '';
  };
}
