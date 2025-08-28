{ pkgs, lib, ... }:

let
  mod = if pkgs.stdenv.isDarwin then "cmd" else "ctrl";

  cond = operants: lib.concatStringsSep " && " operants;

  bindings = [
    {
      key = "${mod}+space";
      command = "editor.action.triggerSuggest";
      when = cond [
        "editorHasCompletionItemProvider"
        "textInputFocus"
        "!editorReadonly"
        "!suggestWidgetVisible"
      ];
    }

    {
      key = "${mod}+shift+g";
      command = "workbench.view.scm";
      when = cond [
        "workbench.scm.active"
      ];
    }

    # Code Navigation
    {
      key = "${mod}+]";
      command = "workbench.action.navigateForward";
    }

    {
      key = "${mod}+[";
      command = "workbench.action.navigateBack";
    }

    # Extension: Markdown All In One
    # Restrict cmd+b & cmd+i shortcuts to selected text
    {
      key = "${mod}+b";
      command = "markdown.extension.editing.toggleBold";
      when = cond [
        "editorHasSelection"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }

    {
      key = "${mod}+i";
      command = "markdown.extension.editing.toggleItalic";
      when = cond [
        "editorHasSelection"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }

    {
      key = "${mod}+b";
      command = "-markdown.extension.editing.toggleBold";
      when = cond [
        "editorTextFocus"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }

    {
      key = "${mod}+i";
      command = "-markdown.extension.editing.toggleItalic";
      when = cond [
        "editorTextFocus"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }
  ];
in

{
  my.programs.vscode.keybindings = bindings;
}
