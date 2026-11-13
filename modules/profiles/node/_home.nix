{ config, lib, ... }:

let
  cfg = config.profiles.node;
in

{
  options.profiles.node.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      node.enable = lib.mkDefault true;
      pnpm.enable = lib.mkDefault true;

      vscode.enableNodeIntegration = lib.mkDefault true;
      cursor.enableNodeIntegration = lib.mkDefault true;
    };
  };
}
