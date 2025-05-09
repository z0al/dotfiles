{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.brave;

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
  imports = [
    ./extensions.nix
  ];

  options.d.programs.brave = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    package = mkOption {
      type = types.package;
      default = pkgs.brave;
    };

    extensions = mkOption {
      type = types.listOf extensionModule;
      default = [ ];
    };

    profile = mkOption {
      type = types.attrs;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    d.programs.brave.profile = {
      # Disable default browser check
      DefaultBrowserSettingEnabled = false;

      # 5 = Open New Tab Page
      # 1 = Restore the last session
      # 4 = Open a list of URLs
      # 6 = Open a list of URLs and restore the last session
      RestoreOnStartup = 5;

      # Block sites from asking for certain permissions
      DefaultNotificationsSetting = 2;
      DefaultGeolocationSetting = 2;

      # Use Cloudflare DNS
      DnsOverHttpsMode = "secure";
      DnsOverHttpsTemplates = "https://chrome.cloudflare-dns.com/dns-query";

      # Disable unwanted features
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BraveAIChatEnabled = false;
      BraveRewardsDisabled = true;
      BraveVPNDisabled = true;
      BraveWalletDisabled = true;
      IPFSEnabled = false;
      PasswordManagerEnabled = false;
      TorDisabled = true;
    };
  };
}
