local M = {}

M.custom = {
	n = {
		["<M-j>"] = { ":m .+1<CR>==", "move text down" },
		["<M-k>"] = { ":m .-2<CR>==", "move text up" },
		["ga"] = { "<Plug>(EasyAlign)", "easy align" },
	},
	i = {
		["<M-j>"] = { "<Esc>:m .+1<CR>==gi", "move text down" },
		["<M-k>"] = { "<Esc>:m .-2<CR>==gi", "move text up" },
	},
	v = {
		["<M-j>"] = { ":m '>+1<CR>gv=gv", "move text down" },
		["<M-k>"] = { ":m '<-2<CR>gv=gv", "move text up" },
		["<"] = { "<gv", "indent left" },
		[">"] = { ">gv", "indent right" },
		["ga"] = { "<Plug>(EasyAlign)", "easy align" },
	},
}

return M
