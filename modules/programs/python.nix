{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.python;

  pythonWithModules = pkgs.python3.withPackages (py: with py; [
    pip
    uv

    # Machine Learning
    numpy
    pandas
    matplotlib
    scikit-learn
    scipy
    torch
    torchvision
  ]);
in

{
  options.my.programs.python = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.python.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pythonWithModules ];
  };
}
