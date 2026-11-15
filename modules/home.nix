{
  config,
  lib,
  pkgs,
  ...
}:

let
  homeModules = lib.fileset.toList (
    lib.fileset.fileFilter (f: f.name == "_home.nix") ./.
  );

  homeFolder =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "/Users/${config.home.username}"
    else
      "/home/${config.home.username}";
in

{
  imports = homeModules;

  home.homeDirectory = homeFolder;
}
