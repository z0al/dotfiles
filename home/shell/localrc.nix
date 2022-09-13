{ config, pkgs, username, ... }:

let
  # Source ~/.localrc if it exists. This can be useful to add extra local shell
  # configuration per machine.
  localrc = "/home/${username}/.localrc";
in

{
  # Bash Integration
  programs.bash.initExtra = ''
    if [ -f "${localrc}" ]; then
      . "${localrc}"
    fi
  '';

  # Fish Integration
  programs.fish.shellInit = ''
    if test -e "${localrc}"
      source "${localrc}"
    end
  '';
}
