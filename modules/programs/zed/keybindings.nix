{ pkgs, ... }:

let
  mod = if pkgs.stdenv.isDarwin then "cmd" else "ctrl";
in

{
  my.programs.zed.settings = {
    # helix_mode = true;
    base_keymap = "VSCode";
  };

  my.programs.zed.keybindings = [
    {
      use_key_equivalents = true;
      bindings = {
        "${mod}-," = "zed::OpenSettingsFile";
      };
    }

    {
      context = "Editor";
      use_key_equivalents = true;
      bindings = {
        "${mod}-space" = "editor::ShowCompletions";
        "${mod}-shift-space" = "editor::ShowWordCompletions";
        "${mod}-o" = "pane::GoBack";
        "${mod}-i" = "pane::GoForward";
      };
    }

    {
      context = "Workspace";
      use_key_equivalents = true;
      bindings = {
        "${mod}-shift-g" = "git_panel::ToggleFocus";
      };
    }
  ];
}
