{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.kubelogin;
in

{
  options.my.programs.kubelogin = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubelogin-oidc
    ];
  };
}
