{ config, lib, ... }:

let
  cfg = config.my.programs.chromium;

  profile = {
    # Disable default browser check
    DefaultBrowserSettingEnabled = false;
    WarnBeforeQuittingEnabled = false;

    # General
    ShowHomeButton = false;

    # Notifications
    DefaultNotificationsSetting = 2;
    NotificationsAllowedForUrls = [
      "https://calendar.google.com"
    ];

    # Block location
    DefaultGeolocationSetting = 2;

    # Use Cloudflare DNS
    DnsOverHttpsMode = "secure";
    DnsOverHttpsTemplates = "https://chrome.cloudflare-dns.com/dns-query";

    # Autofill
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    PasswordManagerEnabled = false;

    # Sync
    SyncTypesListDisabled = [
      # Enabled:
      # "bookmarks"
      # "extensions"
      # "preferences"

      "apps"
      "autofill"
      "passwords"
      "payments"
      "productComparison"
      "readingList"
      "savedTabGroups"
      "tabs"
      "typedUrls"
      "wifiConfigurations"
    ];

    # Privacy
    PrivacySandboxPromptEnabled = false;
    PrivacySandboxAdTopicsEnabled = false;
    PrivacySandboxSiteEnabledAdsEnabled = false;
    PrivacySandboxAdMeasurementEnabled = false;

    # Merge policies when possible. Must have for managed work machines
    PolicyListMultipleSourceMergeList = [ "*" ];
    PolicyDictionaryMultipleSourceMergeList = [ "*" ];
  };
in

{
  imports = [
    ./extensions.nix
    ./site-search.nix
  ];

  options.my.programs.chromium = with lib; {
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
    my.programs.chromium.profile = profile;
  };
}
