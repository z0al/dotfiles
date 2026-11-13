{ config, lib, ... }:

let
  cfg = config.profiles.oxc;
in

{
  options.profiles.oxc.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      oxfmt.enable = lib.mkDefault true;

      vscode.enableOxcIntegration = lib.mkDefault true;
      cursor.enableOxcIntegration = lib.mkDefault true;
    };
  };
}
