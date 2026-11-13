{
  config = {
    home.sessionVariables = {
      DIRENV_WARN_TIMEOUT = "1m";
    };

    programs.direnv = {
      nix-direnv.enable = true;
    };
  };
}
