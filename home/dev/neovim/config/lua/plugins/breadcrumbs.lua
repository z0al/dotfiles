return {
	"utilyre/barbecue.nvim",
	name = "breadcrumbs",
	version = "*",
	event = "BufReadPost",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		symbols = {
			separator = "/",
		},
	},
}
