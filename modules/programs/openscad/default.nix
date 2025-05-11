{ lib, ... }:

{
  options.my.programs.openscad = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
