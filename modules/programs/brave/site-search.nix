{ config, lib, ... }:

let
  cfg = config.my.programs.brave;
in

{
  options.my.programs.brave.siteSearch = with lib; mkOption {
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
    my.programs.brave = {
      profile.SiteSearchSettings = cfg.siteSearch;

      siteSearch = [
        {
          name = "Nix Packages";
          shortcut = "pkgs";
          url = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
        }

        {
          name = "NixOS Options";
          shortcut = "opts";
          url = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
        }

        {
          name = "Nix Darwin Options";
          shortcut = "dar";
          url = "https://searchix.ovh/options/darwin/search?query={searchTerms}";
        }

        {
          name = "Home Manager Options";
          shortcut = "hm";
          url = "https://searchix.ovh/options/home-manager/search?query={searchTerms}";
        }

        {
          name = "GitHub";
          shortcut = "g";
          url = "https://github.com/search?q={searchTerms}&ref=opensearch";
        }

        {
          name = "Nixpkgs GitHub";
          shortcut = "gpkgs";
          url = "https://github.com/search?q=repo%3ANixOS%2Fnixpkgs%20{searchTerms}&type=code";
        }

        {
          name = "Nix Darwin GitHub";
          shortcut = "gdar";
          url = "https://github.com/search?q=repo%3Anix-darwin%2Fnix-darwin%20{searchTerms}&type=code";
        }

        {
          name = "Home Manager GitHub";
          shortcut = "ghm";
          url = "https://github.com/search?q=repo%3Anix-community%2Fhome-manager%20{searchTerms}&type=code";
        }
      ];
    };
  };
}
