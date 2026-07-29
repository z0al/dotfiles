{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.kubelogin;
in

{
  options.programs.kubelogin.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.devOps.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.kubelogin-oidc ];
  };
}
