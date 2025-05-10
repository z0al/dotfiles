{ config, pkgs, lib, ... }:

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

    package = mkOption {
      type = types.package;
      default = pkgs.brave;
    };

    profile = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    d.programs.brave.profile = {
      # Disable default browser check
      DefaultBrowserSettingEnabled = false;

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
