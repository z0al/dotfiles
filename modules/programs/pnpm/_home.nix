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
  options.programs.pnpm.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.typescript.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pnpm ];

    home.shellAliases = {
      # Remove after pnpm v11 is released
      pn = "pnpm";
      pnx = "pnpm dlx";
    };

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.pnpm} completion fish 2>/dev/null | source
    '';
  };
}
