{ lib, ... }:

{
  options.my.programs.finder = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
