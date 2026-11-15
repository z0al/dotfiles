let
  blank = {
    __unkeyed-1.__raw = ''function() return "" end'';
  };
in

{
  programs.nixvim = {
    highlightOverride = {
      WinBar.link = "Normal";
      WinBarNC.link = "Normal";
      StatusLine.link = "Normal";
      StatusLineNC.link = "Normal";
    };

    plugins.web-devicons.enable = true;

    plugins.dropbar = {
      enable = true;
      settings.icons.ui.bar.separator = " › ";
    };

    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme.__raw = ''
            (function()
              local theme = require("lualine.themes.auto")
              for _, mode in pairs(theme) do
                for _, section in ipairs({ "b", "c" }) do
                  if mode[section] then mode[section].bg = "NONE" end
                end
              end
              return theme
            end)()
          '';
          globalstatus = true;
          component_separators = "";
          section_separators = "";
        };

        sections = {
          lualine_a = [
            {
              __unkeyed-1 = "mode";
              padding = {
                left = 1;
                right = 1;
              };
            }
          ];
          lualine_b = [ blank ];
          lualine_c = [ blank ];
          lualine_x = [ "diagnostics" ];
          lualine_y = [ "branch" ];
          lualine_z = [ blank ];
        };
      };
    };
  };
}
