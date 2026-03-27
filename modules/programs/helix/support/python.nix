{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.presets.python;
in

{
  config.my.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      python3Packages.python-lsp-server
    ];
  };
}
