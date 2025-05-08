{ config, lib, ... }:

let
  cfg = config.d.programs.brave;
in

{
  config = lib.mkIf cfg.enable {
    d.programs.brave = {
      profile = {
        ExtensionInstallForcelist = map (e: e.id) cfg.extensions;
        ExtensionSettings = lib.mergeAttrsList
          (map
            (e: {
              "${e.id}" = {
                toolbar_pin = "force_pinned";
              };
            })
            (lib.filter (e: e.pinned) cfg.extensions)
          );
      };

      extensions = [
        {
          name = "1Password";
          id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa";
          pinned = true;
        }

        {
          name = "Dark Reader";
          id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
          pinned = true;
        }

        {
          name = "Privacy Badger";
          id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
        }

        {
          name = "React Developer Tools";
          id = "fmkadmapgofadopljbjfkapdkoienihi";
        }

        {
          name = "Refined GitHub";
          id = "hlepfoohegkhhmjieoechaddaejaokhf";
        }

        {
          name = "Copy as Markdown";
          id = "fkeaekngjflipcockcnpobkpbbfbhmdn";
        }

        {
          name = "Don't F*** with Paste";
          id = "nkgllhigpcljnhoakjkgaieabnkmgdkb";
        }

        {
          name = "Google Translate";
          id = "aapbdbdomjkkjkaonfhkkikfgjllcleb";
        }

        {
          name = "Grammarly";
          id = "kbfnbcaeplbcioakkpcpgfkobkghlhen";
        }

        {
          name = "JSON Formatter";
          id = "bcjindcccaagfpapjjmafapmmgkkhgoa";
        }

        {
          name = "Disable Google Search Text Highlights";
          id = "ompocnnmgiaoieoanemepjflbokldhom";
        }
      ];
    };
  };
}
