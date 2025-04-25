{ config, lib, ... }:

let
  cfg = config.d.programs.direnv;
in

{
  options.d.programs.direnv = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      DIRENV_WARN_TIMEOUT = "1m";
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
