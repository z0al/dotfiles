{ lib, ... }:

{
  options.d.windowManager.focus = with lib; {
    mode = mkOption {
      type = types.enum [
        "click"
        "sloppy"
      ];

      default = "click";
    };
  };
}
