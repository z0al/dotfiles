{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.pnpm = {
    enable = lib.mkDefault config.presets.typescript.enable;
  };

  programs.fish.interactiveShellInit = ''
    ${lib.getExe pkgs.pnpm} completion fish 2>/dev/null | source
  '';
}
