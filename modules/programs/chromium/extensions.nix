{ config, lib, ... }:

let
  cfg = config.my.programs.chromium;

  extensionIds = map (e: e.id) cfg.extensions;

  extensionSettings =
    let
      mkOrNull = cond: value: if (cond == true) then value else null;

      filterNulls = lib.filterAttrs (_: v: v != null);

      setup =
        {
          id,
          pinned,
          hosts,
          ...
        }:
        {
          "${id}" = {
            toolbar_pin = mkOrNull pinned "force_pinned";
            runtime_allowed_hosts = mkOrNull (hosts != [ ]) hosts;
          };
        };
    in
    lib.filterAttrs (_name: value: (filterNulls value) != { }) (
      lib.mergeAttrsList (map setup cfg.extensions)
    );

  extensionModule =
    with lib;
    types.submodule {
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

        settings = mkOption {
          type = types.attrsOf types.anything;
          default = { };
        };
      };
    };

  # Extensions
  privacyExtensions = [
    {
      name = "uBlock Origin Lite";
      id = "ddkjiahejlhfcafbddmgiahcphecmpfh";
      settings = {
        defaultFiltering = "complete";
        strictBlockMode = true;
        rulesets = [
          "-*"
          "+default"
          "+ublock-badware"
          "+urlhaus-full"
          "+adguard-spyware-url"
          "+annoyances-cookies"
          "+annoyances-overlays"
          "+annoyances-social"
          "+annoyances-widgets"
          "+annoyances-others"
          "+deu-0"
        ];
      };
    }

    {
      name = "AdGuard";
      id = "bgnkhhnnamicmpeenaelnjfhikgbkllg";
    }

    {
      name = "Privacy Badger";
      id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
    }
  ];

  uiExtensions = [
    {
      name = "Tabby Cat";
      id = "mefhakmgclhhfbdadeojlkbllmecialg";
    }

    {
      name = "Dark Reader";
      id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      pinned = true;
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
      name = "JSON Formatter";
      id = "bcjindcccaagfpapjjmafapmmgkkhgoa";
    }

    {
      name = "Disable Google Search Text Highlights";
      id = "ompocnnmgiaoieoanemepjflbokldhom";
    }
  ];

  devExtensions = [
    {
      name = "React Developer Tools";
      id = "fmkadmapgofadopljbjfkapdkoienihi";
    }
  ];

  otherExtensions = [
    {
      name = "1Password";
      id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa";
      pinned = true;
    }

    {
      name = "Grammarly";
      id = "kbfnbcaeplbcioakkpcpgfkobkghlhen";
    }

    {
      name = "Copy as Markdown";
      id = "fkeaekngjflipcockcnpobkpbbfbhmdn";
    }

    {
      name = "Google Translate";
      id = "aapbdbdomjkkjkaonfhkkikfgjllcleb";
    }

    {
      name = "Don't F*** with Paste";
      id = "nkgllhigpcljnhoakjkgaieabnkmgdkb";
    }
  ];
in

{
  options.my.programs.chromium.extensions =
    with lib;
    mkOption {
      type = types.listOf extensionModule;
      default = [ ];
    };

  config = lib.mkIf cfg.enable {
    my.programs.chromium = {
      profile = {
        ExtensionInstallForcelist = extensionIds;
        ExtensionSettings = extensionSettings;
      };

      extensions = lib.concatLists [
        privacyExtensions
        uiExtensions
        devExtensions
        otherExtensions
      ];
    };
  };
}
