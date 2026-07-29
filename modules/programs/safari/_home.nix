{ lib, ... }:

{
  options.programs.safari = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
