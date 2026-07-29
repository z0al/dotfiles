{ lib, ... }:

{
  options.programs.beekeeper-studio = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
