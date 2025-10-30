{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.zed;
in

{
  imports = [
    ./keybindings.nix
    ./settings.nix
  ];

  options.my.programs.zed = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };

    keybindings = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zed-editor
    ];

    hm.programs.zed-editor = {
      enable = true;
      # mutableUserSettings = true;
      # mutableUserKeymaps = true;

      userSettings = cfg.settings;
      userKeymaps = cfg.keybindings;

      extensions = [
        "nix"
      ];
    };
  };
}
