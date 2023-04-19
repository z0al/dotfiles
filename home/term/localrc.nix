let
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
    fish.interactiveShellInit = ''
      if test -e "${path}"
        source "${path}"
      end
    '';
  };
}
