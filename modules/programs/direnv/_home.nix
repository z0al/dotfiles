{ lib, ... }:

{
  config = {
    home.sessionVariables = {
      DIRENV_WARN_TIMEOUT = "1m";
    };

    programs.direnv = {
      enable = lib.mkDefault true;
      nix-direnv.enable = true;
    };
  };
}
