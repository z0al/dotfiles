{ config, lib, ... }:

let
  cfg = config.d.programs.brave;
in

{
  options.d.programs.brave.siteSearch = with lib; mkOption {
    type = types.listOf (types.submodule {
      options = {
        name = mkOption {
          type = types.str;
        };

        shortcut = mkOption {
          type = types.str;
        };

        url = mkOption {
          type = types.str;
          apply = url: lib.escapeXML url;
        };
      };
    });

    default = [ ];
  };

  config = lib.mkIf cfg.enable {
    d.programs.brave = {
      # On macOS, this policy is only available on instances that are managed
      # via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise
      # Core.
      profile.SiteSearchSettings = cfg.siteSearch;

      siteSearch = [
        {
          name = "Nix Packages";
          shortcut = "pkgs";
          url = "https://search.nixos.org/packages?channel=unstable&query=%s";
        }

        {
          name = "NixOS Options";
          shortcut = "opts";
          url = "https://search.nixos.org/options?channel=unstable&query=%s";
        }

        {
          name = "Nix Darwin Options";
          shortcut = "dar";
          url = "https://searchix.ovh/options/darwin/search?query=%s";
        }

        {
          name = "Home Manager Options";
          shortcut = "hm";
          url = "https://searchix.ovh/options/home-manager/search?query=%s";
        }

        {
          name = "GitHub";
          shortcut = "gh";
          url = "https://github.com/search?q=%s&ref=opensearch";
        }

        {
          name = "Nixpkgs GitHub";
          shortcut = "nix";
          url = "https://github.com/search?q=repo%3ANixOS%2Fnixpkgs%20%s&type=code";
        }
      ];
    };
  };
}
