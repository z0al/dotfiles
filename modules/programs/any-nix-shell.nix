{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.any-nix-shell;
in

{
  options.d.programs.any-nix-shell = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      any-nix-shell
    ];

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.any-nix-shell} fish | source
    '';
  };
}
