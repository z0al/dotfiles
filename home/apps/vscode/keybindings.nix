{ pkgs, ... }:

let
  bindings = [
    {
      key = "ctrl+shift+g";
      command = "workbench.view.scm";
      when = "workbench.scm.active";
    }
  ];

  mapCtrlToCmd = binding:
    let
      key = builtins.replaceStrings [ "ctrl" ] [ "cmd" ] binding.key;
    in
    binding // { key = key; };
in

{
  programs.vscode.keybindings =
    if pkgs.stdenv.isDarwin
    then map mapCtrlToCmd bindings
    else bindings;
}
