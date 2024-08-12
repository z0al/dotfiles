{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.wezterm;

  mod = if pkgs.stdenv.isDarwin then "CMD" else "CTRL";
  mkLua = lib.generators.mkLuaInline;

  actions = {
    copy = mkLua "act.CopyTo 'Clipboard'";
    paste = mkLua "act.PasteFrom 'Clipboard'";
  };
in

{
  config.d.programs.wezterm = lib.mkIf cfg.enable {
    settings.disable_default_key_bindings = true;

    settings.keys = lib.flatten [
      [
        # Copy
        {
          key = "Insert";
          mods = "CTRL";
          action = actions.copy;
        }

        {
          key = "c";
          mods = "${mod}|SHIFT";
          action = actions.copy;
        }

        # Paste
        {
          key = "Insert";
          mods = "SHIFT";
          action = actions.paste;
        }

        {
          key = "v";
          mods = "${mod}|SHIFT";
          action = actions.paste;
        }

        # Command palette
        {
          key = "p";
          mods = "${mod}|SHIFT";
          action = mkLua "act.ActivateCommandPalette";
        }

        # Clear screen
        {
          key = "l";
          mods = mod;
          action = mkLua ''
            act.Multiple {
              act.ClearScrollback 'ScrollbackAndViewport',
              act.SendKey { key = 'L', mods = 'CTRL' },
            }
          '';
        }

        # Windows
        {
          key = "n";
          mods = mod;
          action = mkLua "act.SpawnWindow";
        }

        # Tabs
        {
          key = "t";
          mods = mod;
          action = mkLua "act.SpawnTab 'DefaultDomain'";
        }

        {
          key = "w";
          mods = mod;
          action = mkLua "act.CloseCurrentTab { confirm = true }";
        }

        {
          key = "Tab";
          mods = "CTRL";
          action = mkLua "act.ActivateTabRelative(1)";
        }

        {
          key = "1";
          mods = mod;
          action = mkLua "act.ActivateTab(0)";
        }

        {
          key = "2";
          mods = mod;
          action = mkLua "act.ActivateTab(1)";
        }

        {
          key = "3";
          mods = mod;
          action = mkLua "act.ActivateTab(2)";
        }

        {
          key = "4";
          mods = mod;
          action = mkLua "act.ActivateTab(3)";
        }

        {
          key = "5";
          mods = mod;
          action = mkLua "act.ActivateTab(4)";
        }

        {
          key = "6";
          mods = mod;
          action = mkLua "act.ActivateTab(5)";
        }

        {
          key = "7";
          mods = mod;
          action = mkLua "act.ActivateTab(6)";
        }

        {
          key = "8";
          mods = mod;
          action = mkLua "act.ActivateTab(7)";
        }

        {
          key = "9";
          mods = mod;
          action = mkLua "act.ActivateTab(-1)";
        }

        # Zoom
        {
          key = "=";
          mods = mod;
          action = mkLua "act.IncreaseFontSize";
        }

        {
          key = "-";
          mods = mod;
          action = mkLua "act.DecreaseFontSize";
        }

        {
          key = "0";
          mods = mod;
          action = mkLua "act.ResetFontSize";
        }

        # Minimize
        {
          key = "m";
          mods = mod;
          action = mkLua "act.Hide";
        }

        # Quit
        {
          key = "q";
          mods = mod;
          action = mkLua "act.QuitApplication";
        }
      ]

      (lib.optional pkgs.stdenv.isDarwin [
        {
          key = "c";
          mods = mod;
          action = actions.copy;
        }

        {
          key = "v";
          mods = mod;
          action = actions.paste;
        }

        {
          key = "h";
          mods = mod;
          action = mkLua "act.HideApplication";
        }
      ])
    ];
  };
}
