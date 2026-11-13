{ config, lib, ... }:

let
  cfg = config.profiles.ruff;
in

{
  options.profiles.ruff.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      ruff.enable = lib.mkDefault true;

      vscode.enableRuffIntegration = lib.mkDefault true;
      cursor.enableRuffIntegration = lib.mkDefault true;
    };
  };
}
