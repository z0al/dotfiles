{ config, lib, ... }:

let
  cfg = config.profiles.rust;
in

{
  options.profiles.rust.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      rustup.enable = lib.mkDefault true;

      vscode.enableRustIntegration = lib.mkDefault true;
      cursor.enableRustIntegration = lib.mkDefault true;
    };
  };
}
