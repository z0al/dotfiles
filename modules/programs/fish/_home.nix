{ lib, osConfig, pkgs, ... }:

{
  config.programs.fish = {
    enable = lib.mkDefault true;

    shellAliases = osConfig.environment.shellAliases // {
      unset = "set -ge";
      unalias = "functions --erase";
    };

    shellAbbrs = {
      ".." = {
        position = "anywhere";
        setCursor = true;
        expansion = "../%";
      };
      "..." = {
        position = "anywhere";
        setCursor = true;
        expansion = "../../%";
      };
      "...." = {
        position = "anywhere";
        setCursor = true;
        expansion = "../../../%";
      };
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "sponge";
        src = sponge.src;
      }
      {
        name = "autopair-fish";
        src = autopair-fish.src;
      }
    ];

    interactiveShellInit = ''
      set -U fish_greeting

      # https://github.com/meaningful-ooo/sponge
      set sponge_purge_only_on_exit true
    '';
  };
}
