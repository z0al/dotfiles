{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.helix;
in

{
  config.my.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      lldb
      marksman
      bash-language-server
      taplo
      terraform-ls
      yaml-language-server
    ];
  };
}
