{ lib, ... }:

{
  options.d.programs.chrome = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
