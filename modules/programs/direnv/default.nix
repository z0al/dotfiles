{ config, lib, ... }:

let
  cfg = config.d.programs.direnv;
in

{
  options.d.programs.direnv = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
