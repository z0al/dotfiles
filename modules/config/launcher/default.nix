{ lib, ... }:

{
  options.my.desktop.launcher = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
