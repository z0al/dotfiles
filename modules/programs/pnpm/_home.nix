{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.pnpm;
in

{
  config = lib.mkIf cfg.enable {
    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.pnpm} completion fish 2>/dev/null | source
    '';
  };
}
