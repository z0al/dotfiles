{ config, pkgs, lib, ... }:

let
  cfg = config.my.presets.nix;
in

{
  config.my.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nixd
      nil
    ];

    languages = {
      language = [{
        name = "nix";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        auto-format = true;

        formatter.command = lib.getExe pkgs.nixpkgs-fmt;
        language-servers = [ "nixd" "nil" ];
      }];

      language-server.nixd = {
        command = lib.getExe pkgs.nixd;
      };

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
