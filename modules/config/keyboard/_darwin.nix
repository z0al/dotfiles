{ config, pkgs, lib, ... }:

let
  cfg = config.d.keyboard;

  capsLockToHyperRule = {
    description = "Map Caps Lock to Hyper";
    manipulators = [
      {
        type = "basic";
        from = { key_code = "caps_lock"; };
        to = [
          {
            key_code = "left_control";
            modifiers = [ "left_option" "left_command" ];
          }
        ];
        to_if_alone = [
          {
            key_code = "slash";
            modifiers = [ "left_control" "left_option" "left_command" ];
          }
        ];
      }
    ];
  };

  karabinerRules =
    (lib.optionals cfg.remapCapsLockToHyper [
      capsLockToHyperRule
    ]);

  karabinerProfile = pkgs.writeText "karabiner.json" (
    builtins.toJSON {
      global = {
        show_in_menu_bar = false;
        check_for_updates_on_startup = false;
        enable_notification_window = false;
      };

      profiles = [
        {
          name = "Default profile";
          selected = true;
          virtual_hid_keyboard = {
            indicate_sticky_modifier_keys_state = false;
            keyboard_type_v2 = "ansi";
          };
          complex_modifications = {
            rules = karabinerRules;
          };
        }
      ];
    });
in

{
  system.keyboard = {
    enableKeyMapping = true;
    nonUS.remapTilde = cfg.remapTilde;
  };

  # Enable keyboard navigation for UI controls via the Tab key
  system.defaults.CustomUserPreferences = {
    NSGlobalDomain.AppleKeyboardUIMode = 3;
  };

  # Used for advanced remapping.
  # FIXME: use nix-darwin's module once the issue below is fixed:
  # https://github.com/nix-darwin/nix-darwin/issues/1041
  homebrew.casks = [
    "karabiner-elements"
  ];

  launchd.user.agents."com.nix.managed.karabiner-elements" = {
    script = ''
      set -euo pipefail

      dir=~/.config/karabiner
      mkdir -p "$dir"

      cd "$dir"
      cp ${karabinerProfile} karabiner.json
      chmod 600 karabiner.json
    '';

    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
    };
  };
}
