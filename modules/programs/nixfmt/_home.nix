{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = config.programs.nixfmt;

  fmt = pkgs.writeShellScriptBin "nixfmt" ''
    #! ${pkgs.bash}/bin/bash
    exec ${lib.getExe pkgs.nixfmt} --width=72 "$@"
  '';
in

{
  options.programs.nixfmt.enable = lib.mkOption {
    type = lib.types.bool;
    default = osConfig.my.presets.nix.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ fmt ];
  };
}
