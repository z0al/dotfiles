{ config, lib, ... }:

let
  cfg = config.profiles.prettier;
in

{
  options.profiles.prettier.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      prettier.enable = lib.mkDefault true;

      vscode.enablePrettierIntegration = lib.mkDefault true;
      cursor.enablePrettierIntegration = lib.mkDefault true;
    };
  };
}
