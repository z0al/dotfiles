{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.programs.fish;
in

{

  options.programs.fish.sources = mkOption {
    type = types.listOf types.str;
    default = [ ];
  };

  config = {
    home.packages = with pkgs.latest; [
      any-nix-shell
    ];

    programs.fish = {
      enable = true;

      plugins = map
        (pkg: {
          name = pkg.name;
          src = pkg.src;
        })
        (with pkgs.fishPlugins; [
          sponge
          autopair-fish
        ]);

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
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish | source

        ${concatStringsSep "\n" (map (path: ''
          if test -e ${path}
            source ${path}
          end
        '') cfg.sources)}
      '';
    };

    d.fs.persisted = {
      directories = [ ".local/share/fish" ];
    };
  };

}
