{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  d.fs.persisted = {
    directories = [ ".local/share/direnv" ];
  };
}
