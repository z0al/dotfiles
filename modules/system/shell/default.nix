{ config, pkgs, lib, ... }:

let
  cfg = config.d.shell;
in

{
  options.d.shell = with lib; {
    init = mkOption {
      type = types.lines;
      default = "";
    };

    aliases = mkOption {
      type = types.attrsOf types.str;
      default = { };
    };
  };

  config = {
    my.osUser.shell = pkgs.fish;

    environment = {
      shells = [ pkgs.fish ];
    };

    environment.shellAliases = cfg.aliases // {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      clear = "tput reset";
      grep = "rg";
      mkdir = "mkdir -p";
    };

    environment.interactiveShellInit = ''
      if [ -f ~/.localrc ]; then
        source ~/.localrc
      fi

      ${cfg.init}
    '';
  };
}

