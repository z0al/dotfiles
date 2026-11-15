{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    opts = {
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      scrolloff = 5;
      number = true;
      signcolumn = "yes";
      ignorecase = true;
      smartcase = true;
      undofile = true;
      splitright = true;
      splitbelow = true;
      showmode = false;
      showtabline = 0;
      laststatus = 3;
      termguicolors = true;
      fillchars = "eob: ";
    };

    clipboard.register = "unnamedplus";

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            vim.cmd.cd(vim.fn.argv(0))
            vim.cmd("bwipeout")
            require("mini.starter").open()
          end
        end,
      })
    '';
  };
}
