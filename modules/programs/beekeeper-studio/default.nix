{ lib, ... }:

{
  options.my.programs.beekeeper-studio = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
