{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        taplo.enable = true;
        lua_ls.enable = true;
      };
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            af = "@function.outer";
            "if" = "@function.inner";
            ac = "@class.outer";
            ic = "@class.inner";
            aa = "@parameter.outer";
            ia = "@parameter.inner";
          };
        };
        move = {
          enable = true;
          goto_next_start."]f" = "@function.outer";
          goto_previous_start."[f" = "@function.outer";
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          toml = [ "taplo" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };

    blink-cmp = {
      enable = true;
      settings.keymap.preset = "default";
    };

    gitsigns = {
      enable = true;
      settings.on_attach.__raw = ''
        function(bufnr)
          local gs = require("gitsigns")
          vim.keymap.set("n", "]c", function() gs.nav_hunk("next") end, { buffer = bufnr })
          vim.keymap.set("n", "[c", function() gs.nav_hunk("prev") end, { buffer = bufnr })
        end
      '';
    };

    mini = {
      enable = true;
      modules.starter = { };
    };

    flash = {
      enable = true;
      settings.modes.char.jump_labels = true;
    };
    nvim-surround.enable = true;

    which-key = {
      enable = true;
      settings = {
        preset = "classic";
        delay = 1000;
      };
    };

    snacks = {
      enable = true;
      settings = {
        lazygit = {
          enabled = true;
          configure = false;
        };
        picker.enabled = true;
      };
    };
  };
}
