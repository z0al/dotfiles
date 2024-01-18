{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.programs.fish;

  sources = [
    # https://github.com/LnL7/nix-darwin#install
    "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
    "/etc/static/fish/config.fish"
  ] ++ config.d.shell.sources;
in

{
  options.d.programs.fish = {
    enable = mkOption {
      default = config.d.profiles.base.enable;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      any-nix-shell
    ];

    d.fs.persisted = {
      directories = [ ".local/share/fish" ];
    };

    d.hm = [
      {
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

          shellAliases = {
            unset = "set -e";
          };

          interactiveShellInit = ''
            set -U fish_greeting

            ${pkgs.any-nix-shell}/bin/any-nix-shell fish | source

            ${concatStringsSep "\n" (map (path: ''
              if test -e ${path}
                source ${path}
              end
            '') sources)}
          '';
        };
      }
    ];
  };
}
