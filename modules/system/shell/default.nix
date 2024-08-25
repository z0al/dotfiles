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

    variables = mkOption {
      type = types.attrsOf types.str;
      default = { };
    };
  };

  config = {
    my.osUser.shell = pkgs.fish;

    environment = {
      shells = [ pkgs.fish ];

      variables = cfg.variables;

      shellAliases = cfg.aliases // {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";

        clear = "tput reset";
        mkdir = "mkdir -p";
      };

      interactiveShellInit = ''
        if [ -f ~/.localrc ]; then
          source ~/.localrc
        fi

        export PATH="$HOME/.local/bin:$PATH"

        ${cfg.init}
      '';
    };
  };
}

