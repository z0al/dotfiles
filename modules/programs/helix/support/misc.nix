{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs.unstable; [
      lldb
      marksman
      nodePackages.bash-language-server
      taplo
      terraform-ls
      yaml-language-server
    ];
  };
}
