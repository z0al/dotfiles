{ lib, ... }:

{
  options.my.keyboard = with lib; {
    remapTilde = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Remap § to ` in non-US keyboards, where the backtick & tilde are in an
        inconvenient location.
      '';
    };

    remapCapsLockToHyper = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Remap Caps Lock to Hyper (without shift) in Drawin or Super/Winkey in
        Linux.
      '';
    };
  };
}
