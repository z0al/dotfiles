-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

vim.opt.fileencoding = "utf-8"
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.filetype.add({
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
	},
})
