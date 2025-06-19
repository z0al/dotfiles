{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;

  vscodePackage = pkgs.code-cursor;
in

{
  imports = [
    ./extensions.nix
    ./keybindings.nix
    ./settings.nix
  ];

  options.my.programs.vscode = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };

    keybindings = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
    };

    extensions = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vscodePackage
      nixd
    ];

    hm.programs.vscode = {
      enable = true;
      package = vscodePackage;
      mutableExtensionsDir = true;
      profiles.default = {
        inherit (cfg) keybindings extensions;
        userSettings = cfg.settings;
      };
    };
  };
}
