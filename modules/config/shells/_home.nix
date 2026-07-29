{ pkgs, lib, ... }:

{
  config = {
    home.sessionPath = [ "$HOME/.local/bin" ];

    home.shellAliases = {
      ".." = "cd ../";
      "..." = "cd ../../";
      "...." = "cd ../../../";

      clear = "tput reset";
      mkdir = "mkdir -p";

      open = lib.mkIf pkgs.stdenv.isLinux "xdg-open";
    };

    # Disables "last login" message in terminals
    home.file.".hushlogin".text = "";

    # Quit pager on ESC ESC
    home.file.".lesskey".text = ''
      \e quit
    '';

    programs.bash.initExtra = ''
      if [ -f ~/.localrc ]; then
        source ~/.localrc
      fi
    '';

    programs.fish.interactiveShellInit = ''
      if test -f ~/.localrc
        source ~/.localrc
      end
    '';
  };
}
