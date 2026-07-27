{ config, lib, ... }:

let
  cfg = config.dot.programs.pnpm;
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
