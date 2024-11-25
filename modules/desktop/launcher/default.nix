{ lib, ... }:

{
  options.d.desktop.launcher = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
