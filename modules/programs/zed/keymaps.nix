{ pkgs, ... }:

let
  mod = if pkgs.stdenv.hostPlatform.isDarwin then "cmd" else "ctrl";
in

{
  programs.zed-editor.userKeymaps = [
    # Settings
    {
      context = "!SettingsWindow";
      bindings = {
        "${mod}-," = "zed::OpenSettingsFile";
        "${mod}-shift-," = "zed::OpenProjectSettingsFile";
      };
    }

    # Vim
    {
      context = "Editor && vim_mode == insert";
      bindings = {
        "${mod}-c" = "vim::NormalBefore";
      };
    }

    # Git
    {
      context = "Workspace";
      bindings = {
        "${mod}-shift-g" = [
          "task::Spawn"
          { task_name = "LazyGit"; }
        ];
      };
    }

    {
      context = "Editor && vim_mode == normal";
      bindings = {
        "space g g" = [
          "task::Spawn"
          { task_name = "LazyGit"; }
        ];
        "space g p" = "git::Pull";
      };
    }
  ];
}
