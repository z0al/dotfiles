{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.any-nix-shell;
in

{
  options.d.programs.any-nix-shell = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      any-nix-shell
    ];

    d.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.any-nix-shell} fish | source
    '';
  };
}
