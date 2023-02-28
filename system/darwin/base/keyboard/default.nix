{
  services.karabiner-elements.enable = true;

  xdg.configFile."karabiner/karabiner.json".text = builtins.toJSON {
    global = {
      check_for_updates_on_startup = false;
      show_in_menu_bar = false;
      show_profile_name_in_menu_bar = false;
    };

    profiles = [
      {
        name = "PC-Style Shortcuts";
        selected = true;
        complex_modifications = {
          rules = import ./rules.nix;
        };
      }
    ];
  };
}
