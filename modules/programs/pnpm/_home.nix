{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = config.programs.pnpm;
in

{
  options.programs.pnpm.enable = lib.mkOption {
    type = lib.types.bool;
    default = osConfig.my.presets.typescript.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pnpm ];

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.pnpm} completion fish 2>/dev/null | source
    '';
  };
}
