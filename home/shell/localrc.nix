{ username, ... }:

let
  # Source ~/.localrc if it exists. This can be useful to add extra local shell
  # configuration per machine.
  localrc = "/home/${username}/.localrc";
in

{
  programs = {
    # Bash Integration
    bash.initExtra = ''
      if [ -f "${localrc}" ]; then
        . "${localrc}"
      fi
    '';

    # Fish Integration
    fish.shellInit = ''
      if test -e "${localrc}"
        source "${localrc}"
      end
    '';
  };
}
