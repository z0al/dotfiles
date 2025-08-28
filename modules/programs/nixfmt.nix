{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.nixfmt;

  fmt = pkgs.writeShellScriptBin "nixfmt" ''
    #! ${pkgs.bash}/bin/bash
    exec ${lib.getExe pkgs.nixfmt} --width=72 "$@"
  '';
in

{
  options.my.programs.nixfmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.nix.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ fmt ];
  };
}
