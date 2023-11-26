{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.programs.bash;
in

{
  options.programs.bash.extraSources = mkOption {
    type = types.listOf types.str;
    default = [ ];
  };

  config = {
    programs = {
      bash = {
        enable = true;
        historyIgnore = [ "exit" "clear" ];
        historyControl = [ "ignoredups" "ignorespace" "erasedups" ];

        initExtra = ''
          ${concatStringsSep "\n" (map (path: ''
          if [ -f "${path}" ]; then
             . "${path}"
          fi
          '') cfg.extraSources)}
        '';
      };

      readline = {
        enable = true;
        bindings = {
          "\\C-h" = "backward-kill-word";
        };
      };
    };
  };
}
