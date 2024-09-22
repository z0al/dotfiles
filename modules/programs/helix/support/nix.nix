{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.nix;
  package = pkgs.unstable.nil;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = [ package ];

    languages = {
      language = [{
        name = "nix";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        formatter.command = lib.getExe pkgs.nixpkgs-fmt;
      }];

      language-server.nil = {
        command = lib.getExe package;

        config.nil.nix = {
          binary = lib.getExe pkgs.nix;
          flake = {
            autoEvalInputs = true;
          };
        };
      };
    };
  };
}
