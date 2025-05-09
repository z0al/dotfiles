{ lib, ... }:

{
  options.d.trackpad = with lib; {
    tapToClick = mkOption {
      type = types.bool;
      default = true;
    };

    naturalScrolling = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
