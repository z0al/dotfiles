{
  config,
  pkgs,
  lib,
  ...
}:

{
  config = lib.mkIf config.my.programs.git.enable {
    environment.shellAliases.lz = lib.getExe pkgs.lazygit;
  };
}
