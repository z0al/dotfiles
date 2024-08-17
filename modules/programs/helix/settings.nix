{ config, lib, theme, ... }:

let
  cfg = config.d.programs.helix;

  themeMapping = {
    catppuccin = "catppuccin_mocha";
  };
in

{
  config.d.programs.helix.settings = lib.mkIf cfg.enable {
    theme = themeMapping.${theme};

    editor = {
      auto-save = {
        focus-lost = true;

        after-delay = {
          enable = true;
          timeout = 5000;
        };
      };

      auto-format = true;
      bufferline = "never";
      color-modes = true;
      cursorline = true;
      indent-guides.render = true;
      line-number = "absolute";
      soft-wrap.enable = true;

      # FIXME: remove once https://github.com/helix-editor/helix/issues/1475
      # is fixed
      # auto-info = false;

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      statusline = {
        mode.normal = "";
        mode.insert = "";
        mode.select = "";

        left = [ "mode" "spacer" "spinner" "file-name" ];
        right = [
          "diagnostics"
          "position"
          "primary-selection-length"
          "file-encoding"
          "file-type"
          "version-control"
          "spacer"
          "position-percentage"
        ];
      };
    };
  };
}
