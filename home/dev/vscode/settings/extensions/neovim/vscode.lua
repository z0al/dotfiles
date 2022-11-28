function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
			options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- <leader> shows which-key menu
map({"n", "x"}, "<Leader>", ":call VSCodeNotify('whichkey.show')<CR>", { silent = true })

-- CTRL+/ toggles comment
map({"n", "v", "i"}, "<C-/>", ":call VSCodeNotify('editor.action.commentLine')<CR>")

-- <M-Up/Down> moves lines up/down
map({"n", "v"}, "<M-Up>", ":call VSCodeNotify('editor.action.moveLinesUpAction')<CR>")
map({"n", "v"}, "<M-Down>", ":call VSCodeNotify('editor.action.moveLinesDownAction')<CR>")
