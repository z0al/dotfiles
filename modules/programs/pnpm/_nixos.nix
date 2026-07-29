{ config, lib, ... }:

let
  cfg = config.my.programs.pnpm;
in

{
  config = lib.mkIf cfg.enable {
    environment.shellAliases = {
      # Remove after pnpm v11 is released
      pn = "pnpm";
      pnx = "pnpm dlx";
    };
  };
}
