{ pkgs, ... }:

let
  mod = if pkgs.stdenv.hostPlatform.isDarwin then "cmd" else "ctrl";
in

{
  programs.zed-editor.userKeymaps = [
    {
      context = "!SettingsWindow";
      bindings = {
        "${mod}-," = "zed::OpenSettingsFile";
      };
    }

    {
      context = "Editor && vim_mode == insert";
      bindings = {
        "j k" = "vim::NormalBefore";
        "k j" = "vim::NormalBefore";
      };
    }

    {
      context = "Editor && vim_mode == normal";
      bindings = {
        "space g" = [
          "task::Spawn"
          {
            task_name = "LazyGit";
            reveal_target = "center";
          }
        ];
      };
    }
  ];
}
