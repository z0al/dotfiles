{
  nix.gc = {
    interval.Day = 7;
  };

  nix.linux-builder = {
    enable = true;
    config.virtualisation.darwin-builder.diskSize = 80 * 1024;
  };
}
