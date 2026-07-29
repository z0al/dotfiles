{ lib, ... }:

{
  config = {
    home.stateVersion = lib.trivial.release;

    xdg.enable = true;
    programs.home-manager.enable = true;
  };
}
