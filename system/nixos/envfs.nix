{
  # https://github.com/Mic92/envfs
  services.envfs.enable = true;

  environment.variables = {
    ENVFS_RESOLVE_ALWAYS = "1";
  };
}
