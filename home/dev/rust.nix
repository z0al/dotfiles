{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.dev.rust;
in

{
  options.d.dev.rust = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (fenix.stable.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
      rust-analyzer
    ];

    d.fs.persisted = {
      directories = [
        ".cargo"
        ".rustup"
      ];
    };
  };
}
