{
  # Build aarch64-linux guests on Apple Silicon.
  nix.linux-builder = {
    enable = true;
    config.virtualisation.darwin-builder.diskSize = 100 * 1024;
  };

  nix.gc = {
    interval.Day = 7;
  };
}
