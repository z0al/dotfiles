let
  # Source ~/.localrc if it exists. This can be useful to add extra local shell
  # configuration per machine.
  path = "$HOME/.localrc";
in

{
  programs = {
    # Bash Integration
    bash.initExtra = ''
      if [ -f "${path}" ]; then
        . "${path}"
      fi
    '';

    # Fish Integration
    fish.shellInit = ''
      if test -e "${path}"
        source "${path}"
      end
    '';
  };
}
