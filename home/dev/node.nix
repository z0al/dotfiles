{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.dev.node;
in

{
  options.d.dev.node = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
      fnm
    ];

    # change npm cache location to ~/.cache
    home.sessionVariables = {
      npm_config_cache = "${config.xdg.cacheHome}/npm";
    };

    home.shellAliases = {
      nvm = "fnm";
    };

    programs.bash.initExtra = ''
      eval "$(fnm env --use-on-cd)"
    '';

    programs.fish.interactiveShellInit = ''
      fnm env --use-on-cd | source
    '';

    d.fs.persisted = {
      directories = [
        ".cache/npm"
        ".cache/yarn"
        ".local/share/fnm"
      ];
      files = [ ".npmrc" ".yarnrc" ];
    };
  };
}
