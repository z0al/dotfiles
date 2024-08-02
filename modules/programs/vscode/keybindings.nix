{ pkgs, ... }:

let
  bindings = [
    {
      key = "cmd+shift+g";
      command = "workbench.view.scm";
      when = "workbench.scm.active";
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
