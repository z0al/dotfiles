{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.programs.fish;

  plugins = with pkgs.fishPlugins; [
    sponge
    autopair-fish
    foreign-env
  ];
in

{
  options.programs.fish.extraSources = mkOption {
    type = types.listOf types.str;
    default = [ ];
  };

  config = {
    home.packages = with pkgs; [
      any-nix-shell
    ] ++ plugins;

    programs.fish = {
      enable = true;

      shellInit = ''
        # Disable greeting message
        set -U fish_greeting

        # Bind CTRL+Backspace to delete a word
        bind \b backward-kill-word
      '';

      shellAliases = {
        unset = "set -e";
      };

      interactiveShellInit = ''
        any-nix-shell fish --info-right | source

        ${concatStringsSep "\n" (map (path: ''
          if test -e "${path}"
            source "${path}"
          end
        '') cfg.extraSources)}
      '';
    };

    d.fs.persisted = {
      directories = [ ".local/share/fish" ];
    };
  };
}
