{ lib, ... }:

{
  options.d.keyboard = with lib; {
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
        Remap Caps Lock to Ctrl+Opt+Cmd in Drawin (this is "Meh" but I like
        "Hyper" better) or Super/Winkey in Linux.
      '';
    };
  };
}
