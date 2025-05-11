{ lib, ... }:

{
  options.my.dock = with lib; {
    position = mkOption {
      type = types.enum [ "left" "bottom" "right" ];
      default = "bottom";
    };

    autoHide = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
