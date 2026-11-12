{ config, lib, ... }:

let
  cfg = config.programs.zed-editor;
in

{
  imports = [
    ./keymaps.nix
    ./settings.nix
    ./tasks.nix
  ];

  programs.zed-editor = {
    enable = lib.mkDefault false;

    mutableUserDebug = true;
    mutableUserSettings = true;
    mutableUserKeymaps = true;
    mutableUserTasks = true;

    extensions = [
      "charmed-icons"
      "nix"
      "toml"

      "python-snippets"
      "rust-snippets"
      "react-typescript-snippets"
    ];

    themes = {
      poimandres = ./theme.json;
    };
  };

  home.shellAliases = lib.mkIf cfg.enable {
    zed = lib.getExe cfg.package;
  };
}
