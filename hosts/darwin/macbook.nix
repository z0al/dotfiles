{
  d.presets = {
    typescript.enable = true;
    python.enable = true;
    rust.enable = true;
  };

  d.programs = {
    obsidian.enable = true;
    openscad.enable = true;
  };

  # Required to run `up vm`
  nix.linux-builder = {
    enable = true;
    ephemeral = true;
    supportedFeatures = [
      "benchmark"
      "big-parallel"
      "kvm"
      "nixos-test"
    ];
  };
}
