{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev.nix;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nil
    ];

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
        command = lib.getExe pkgs.nil;

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
