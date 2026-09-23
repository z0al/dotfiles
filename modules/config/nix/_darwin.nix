{
  # Build aarch64-linux guests on Apple Silicon.
  nix.linux-builder.enable = true;

  nix.gc = {
    interval.Day = 7;
  };
}
