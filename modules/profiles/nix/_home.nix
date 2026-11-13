{ config, lib, ... }:

let
  cfg = config.profiles.nix;
in

{
  options.profiles.nix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      nixd.enable = lib.mkDefault true;
      nixfmt.enable = lib.mkDefault true;

      vscode.enableNixIntegration = lib.mkDefault true;
      cursor.enableNixIntegration = lib.mkDefault true;
    };
  };
}
