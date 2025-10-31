{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.zed;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zed-editor
    ];

    environment.shellAliases = {
      zed = "zeditor";
    };
  };
}
