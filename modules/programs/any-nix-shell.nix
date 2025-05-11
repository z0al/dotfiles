{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.any-nix-shell;
in

{
  options.my.programs.any-nix-shell = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      any-nix-shell
    ];

    my.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.any-nix-shell} fish | source
    '';
  };
}
