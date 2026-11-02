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

    # LSP
    {
      context = "VimControl && !menu";
      bindings = {
        "g d" = "editor::GoToDefinition";
        "g shift-d" = "editor::GoToDeclaration";
        "g r r" = "editor::FindAllReferences";
        "g r i" = "editor::GoToImplementation";
        "g r t" = "editor::GoToTypeDefinition";
        "g r n" = "editor::Rename";
        "g r a" = "editor::ToggleCodeActions";
        "shift-k" = "editor::Hover";
        "g shift-o" = "outline::Toggle";
        "g shift-w" = "project_symbols::Toggle";
      };
    }

    {
      context = "vim_mode == normal";
      bindings = {
        "] d" = "editor::GoToDiagnostic";
        "[ d" = "editor::GoToPreviousDiagnostic";
        "] c" = "editor::GoToHunk";
        "[ c" = "editor::GoToPreviousHunk";
      };
    }

    {
      context = "vim_mode == normal || vim_mode == visual || vim_mode == operator";
      bindings = {
        "] f" = "vim::NextMethodStart";
        "[ f" = "vim::PreviousMethodStart";
        "] b" = "pane::ActivateNextItem";
        "[ b" = "pane::ActivatePreviousItem";
      };
    }

    # Text objects
    {
      context = "vim_operator == a || vim_operator == i";
      bindings = {
        "f" = "vim::Method";
        "c" = "vim::Class";
        "a" = "vim::Argument";
        "i" = "vim::IndentObj";
      };
    }

    # Surround
    {
      context = "vim_operator == y";
      bindings = {
        "s" = [
          "vim::PushAddSurrounds"
          { }
        ];
      };
    }

    {
      context = "vim_operator == d";
      bindings = {
        "s" = "vim::PushDeleteSurrounds";
      };
    }

    {
      context = "vim_operator == c";
      bindings = {
        "s" = [
          "vim::PushChangeSurrounds"
          { }
        ];
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
