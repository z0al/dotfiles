{ config, lib, ... }:

{
  options.d.programs.openscad = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
