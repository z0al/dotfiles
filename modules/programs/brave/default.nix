{ config, lib, ... }:

let
  cfg = config.d.programs.brave;
in

{
  imports = [
    ./extensions.nix
    ./site-search.nix
  ];

  options.d.programs.brave = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    profile = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {
    d.programs.brave.profile = {
      # Disable default browser check
      DefaultBrowserSettingEnabled = false;

      # General
      ShowHomeButton = false;

      # Block sites from asking for certain permissions
      DefaultNotificationsSetting = 2;
      DefaultGeolocationSetting = 2;

      # Use Cloudflare DNS
      DnsOverHttpsMode = "secure";
      DnsOverHttpsTemplates = "https://chrome.cloudflare-dns.com/dns-query";

      # Autofill
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      PasswordManagerEnabled = false;

      # Brave being brave
      BraveAIChatEnabled = false;
      BraveRewardsDisabled = true;
      BraveVPNDisabled = true;
      BraveWalletDisabled = true;
      IPFSEnabled = false;
      TorDisabled = true;

      # The follwoing policies are not available on macOS unless managed via a
      # cloud-based Mobile Device Management (MDM) solution.
      #
      # Ref:
      # - https://chromeenterprise.google/policies/atomic-groups/#Homepage
      # - https://chromeenterprise.google/policies/atomic-groups/#RestoreOnStartup
      # - https://chromeenterprise.google/policies/atomic-groups/#DefaultSearchProvider

      # Search
      DefaultSearchProviderEnabled = true;
      DefaultSearchProviderName = "Google";
      DefaultSearchProviderKeyword = "go";
      DefaultSearchProviderSearchURL = "https://www.google.com/search?q=%s";

      # Use blank new tab as homepage
      HomepageIsNewTabPage = true;

      # Do not restore tabs on startup
      RestoreOnStartup = 5;
    };
  };
}
