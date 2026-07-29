{ lib, ... }:

{
  options.programs.openscad = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
