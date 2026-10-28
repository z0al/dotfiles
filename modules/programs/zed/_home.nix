{ pkgs, lib, ... }:

{
  imports = [
    ./keymaps.nix
    ./settings.nix
  ];

  programs.zed-editor = {
    enable = lib.mkDefault true;

    defaultEditor = true;
    mutableUserDebug = true;
    mutableUserSettings = true;
    mutableUserKeymaps = true;
    mutableUserTasks = true;

    extensions = [
      "charmed-icons"
      "nix"
      "toml"
    ];

    themes = {
      poimandres = ./theme.json;
    };
  };

  home.shellAliases = {
    zed = lib.getExe pkgs.zed-editor;
  };
}
