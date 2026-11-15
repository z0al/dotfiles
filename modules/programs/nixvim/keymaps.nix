{
  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }
    # Flash
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = ''function() require("flash").jump() end'';
      options.desc = "Flash";
    }
    {
      mode = [
        "n"
        "o"
      ];
      key = "S";
      action.__raw = ''function() require("flash").treesitter() end'';
      options.desc = "Flash treesitter";
    }

    # Files
    {
      key = "<C-p>";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find files";
    }
    {
      key = "<leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find files";
    }
    {
      key = "<leader>fg";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Grep";
    }

    # LSP
    {
      key = "gd";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
    }
    {
      key = "gD";
      action.__raw = "vim.lsp.buf.declaration";
    }
    {
      key = "grr";
      action.__raw = "function() Snacks.picker.lsp_references() end";
    }
    {
      key = "gri";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
    }
    {
      key = "grt";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
    }
    {
      key = "gO";
      action.__raw = "function() Snacks.picker.lsp_symbols() end";
    }
    {
      key = "gW";
      action.__raw = "function() Snacks.picker.lsp_workspace_symbols() end";
    }

    # Git
    {
      key = "<leader>gg";
      action.__raw = "function() Snacks.lazygit() end";
      options.desc = "LazyGit";
    }
    {
      key = "<leader>gp";
      action.__raw = ''
        function()
          vim.api.nvim_echo({ { "git pull…" } }, false, {})
          vim.system({ "git", "pull" }, { text = true }, function(res)
            vim.schedule(function()
              local out = vim.trim(res.code == 0 and res.stdout or res.stderr .. res.stdout)
              local line = out:match("[^\n]+$") or ""
              if res.code == 0 then
                vim.api.nvim_echo({ { "git pull: " .. line } }, false, {})
                vim.cmd("checktime")
              else
                vim.api.nvim_echo({ { "git pull failed: " .. line, "ErrorMsg" } }, true, {})
              end
            end)
          end)
        end
      '';
      options.desc = "Git pull";
    }
  ];
}
