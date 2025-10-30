{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.zed;

  borderlessAyu = pkgs.fetchFromGitHub {
    owner = "babyccino";
    repo = "Borderless-Ayu-Zed";
    rev = "main";
    hash = "sha256-q3LcZ65eW7PHJVSIuJ6toPVM0nncBSfepsus8OYhuIc=";
  };
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

    environment.shellAliases = {
      zed = "zeditor";
    };

    hm.programs.zed-editor = {
      enable = true;
      # mutableUserSettings = true;
      # mutableUserKeymaps = true;

      userSettings = cfg.settings;
      userKeymaps = cfg.keybindings;

      themes = {
        borderless = builtins.fromJSON (
          builtins.readFile "${borderlessAyu}/ayu-borderless.json"
        );
      };

      extensions = [
        "nix"
      ];
    };
  };
}
