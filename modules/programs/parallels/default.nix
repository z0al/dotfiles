{ lib, ... }:

{
  options.my.programs.parallels = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
