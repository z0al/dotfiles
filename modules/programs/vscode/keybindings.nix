{ pkgs, lib, ... }:

let
  cond = operants:
    lib.concatStringsSep " && " operants;

  bindings = [
    {
      key = "cmd+space";
      command = "editor.action.triggerSuggest";
      when = cond [
        "editorHasCompletionItemProvider"
        "textInputFocus"
        "!editorReadonly"
        "!suggestWidgetVisible"
      ];
    }

    {
      key = "cmd+shift+g";
      command = "workbench.view.scm";
      when = cond [
        "workbench.scm.active"
      ];
    }

    # Extension: Markdown All In One
    # Restrict cmd+b & cmd+i shortcuts to selected text
    {
      key = "cmd+b";
      command = "markdown.extension.editing.toggleBold";
      when = cond [
        "editorHasSelection"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }

    {
      key = "cmd+i";
      command = "markdown.extension.editing.toggleItalic";
      when = cond [
        "editorHasSelection"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }

    {
      key = "cmd+b";
      command = "-markdown.extension.editing.toggleBold";
      when = cond [
        "editorTextFocus"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }

    {
      key = "cmd+i";
      command = "-markdown.extension.editing.toggleItalic";
      when = cond [
        "editorTextFocus"
        "!editorReadonly"
        "editorLangId =~ /^markdown$/"
      ];
    }
  ];

  mapCmdToCtrl = binding:
    let
      key = builtins.replaceStrings [ "cmd" ] [ "ctrl" ] binding.key;
    in
    binding // { key = key; };
in

{
  my.programs.vscode.keybindings =
    if pkgs.stdenv.isDarwin
    then bindings
    else map mapCmdToCtrl bindings;
}
