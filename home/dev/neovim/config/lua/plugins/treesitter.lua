return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"bash",
				"css",
				"diff",
				"dockerfile",
				"fish",
				"go",
				"graphql",
				"html",
				"javascript",
				"json",
				"json5",
				"lua",
				"markdown_inline",
				"markdown",
				"nix",
				"prisma",
				"python",
				"query",
				"regex",
				"rust",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			})
		end,
	},
}
