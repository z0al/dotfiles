{ lib, ... }:

{
  options.d.windowManager.tiling = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
