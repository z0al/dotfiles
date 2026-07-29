{ config, lib, ... }:

let
  cfg = config.dot.programs.chrome;
in

{
  config = lib.mkIf cfg.enable {
    environment.etc."opt/chrome/policies/managed/default.json" = {
      text = builtins.toJSON cfg.profile;
    };
  };
}
