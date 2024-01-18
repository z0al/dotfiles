{ lib, ... }:

let
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
    fish.interactiveShellInit = ''
      # Homebrew
      if test -e /opt/homebrew/bin/brew;
        ${initBrew};
      end
    '';
  };
}
