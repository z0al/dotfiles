{ config, lib, ... }:

let
  cfg = config.profiles.kubernetes;
in

{
  options.profiles.kubernetes.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      kubectl.enable = lib.mkDefault true;
      kubectx.enable = lib.mkDefault true;
      kubelogin.enable = lib.mkDefault true;
    };
  };
}
