{ config, lib, ... }:

let
  cfg = config.d.programs.brave;

  extensionIds = map (e: e.id) cfg.extensions;

  extensionSettings =
    let
      mkOrNull = cond: value:
        if (cond == true) then value else null;

      filterNulls = lib.filterAttrs (_: v: v != null);

      setup = { id, pinned, hosts, ... }: {
        "${id}" = {
          toolbar_pin = mkOrNull pinned "force_pinned";
          runtime_allowed_hosts = mkOrNull (hosts != [ ]) hosts;
        };
      };
    in
    lib.filterAttrs
      (_name: value:
        (filterNulls value) != { })
      (lib.mergeAttrsList
        (map setup cfg.extensions));

  extensionModule = with lib; types.submodule {
    options = {
      name = mkOption {
        type = types.str;
      };

      id = mkOption {
        type = types.str;
      };

      pinned = mkOption {
        type = types.bool;
        default = false;
      };

      hosts = mkOption {
        type = types.listOf types.str;
        default = [ ];
      };
    };
  };
in

{
  options.d.programs.brave.extensions = with lib; mkOption {
    type = types.listOf extensionModule;
    default = [ ];
  };

  config = lib.mkIf cfg.enable {
    d.programs.brave = {
      profile = {
        ExtensionInstallForcelist = extensionIds;
        ExtensionSettings = extensionSettings;
      };

      extensions = [
        {
          name = "1Password";
          id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa";
          pinned = true;
        }

        {
          name = "AdGuard";
          id = "bgnkhhnnamicmpeenaelnjfhikgbkllg";
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

          hosts = [
            "https://github.com"
            "https://gist.github.com"
          ];
        }

        {
          name = "Floccus Bookmarks Sync";
          id = "fnaicdffflnofjppbagibeoednhnbjhg";
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
