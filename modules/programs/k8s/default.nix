{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.kubectl;
in

{
  imports = [
    ./kubelogin.nix
    ./kubeswitch.nix
  ];

  options.d.programs.kubectl = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.ops.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubectl
    ];
  };
}
