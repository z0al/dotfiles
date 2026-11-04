{
  lib,
  pkgs,
  ...
}:

let
  ghWrapped = pkgs.symlinkJoin {
    name = "gh-wrapped";
    paths = [
      (pkgs.writeShellScriptBin "gh" ''
        if [ "$1" = auth ] && [ "$2" = token ]; then
          echo "gho_0000000000000000000000000000000000000000"
          exit 0
        fi
        exec ${lib.getExe pkgs.gh} "$@"
      '')
      pkgs.gh
    ];
    meta.mainProgram = "gh";
  };
in

{
  config = {
    programs.gh = {
      enable = lib.mkDefault true;
      settings.git_protocol = "ssh";
      package = ghWrapped;
    };
  };
}
