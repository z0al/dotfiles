{ pkgs, ... }:

let
  bindings = [
    {
      key = "cmd+shift+g";
      command = "workbench.view.scm";
      when = "workbench.scm.active";
    }

    # Extension: Markdown All In One
    # Restrict cmd+b & cmd+i shortcuts to selected text
    {
      key = "cmd+b";
      command = "markdown.extension.editing.toggleBold";
      when = "editorHasSelection && !editorReadonly && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
    }

    {
      key = "cmd+i";
      command = "markdown.extension.editing.toggleItalic";
      when = "editorHasSelection && !editorReadonly && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
    }

    {
      key = "cmd+b";
      command = "-markdown.extension.editing.toggleBold";
      when = "editorTextFocus && !editorReadonly && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
    }
    {
      key = "cmd+i";
      command = "-markdown.extension.editing.toggleItalic";
      when = "editorTextFocus && !editorReadonly && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
    }
  ];

  mapCmdToCtrl = binding:
    let
      key = builtins.replaceStrings [ "cmd" ] [ "ctrl" ] binding.key;
    in
    binding // { key = key; };
in

{
  d.programs.vscode.keybindings =
    if pkgs.stdenv.isDarwin
    then bindings
    else map mapCmdToCtrl bindings;
}
