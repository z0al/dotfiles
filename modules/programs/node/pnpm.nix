{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.pnpm;
in

{
  options.my.programs.pnpm = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.typescript.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nodePackages.pnpm
    ];

    environment.shellAliases = {
      # Remove after pnpm v11 is released
      pn = "pnpm";
      pnx = "pnpm dlx";
    };

    my.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.nodePackages.pnpm} completion fish 2>/dev/null | source
    '';
  };
}
