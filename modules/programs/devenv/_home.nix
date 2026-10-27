{
  lib,
  ...
}:

{
  programs.devenv = {
    enable = lib.mkDefault false;
  };
}
