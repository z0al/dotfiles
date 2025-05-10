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
      HomepageIsNewTabPage = true;

      # On macOS, this policy is only available on instances that are managed
      # via MDM, joined to a domain via MCX or enrolled in Chrome Enterprise
      # Core.
      # Ref: https://chromeenterprise.google/policies/#RestoreOnStartup
      RestoreOnStartup = 5;

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
    };
  };
}
