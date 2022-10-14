local M = {}

M.symbolsOutline = {
	n = {
		["<C-b>"] = { ":SymbolsOutline<CR>", "Symbols Outline" },
	},
}

M.scrollBuffer = {
	n = {
		["<C-y>"] = { "3<C-y>", "scroll up" },
		["<C-e>"] = { "3<C-e>", "scroll down" },
	},
}

M.altMoveText = {
	n = {
		["<M-j>"] = { ":m .+1<CR>==", "move text down" },
		["<M-k>"] = { ":m .-2<CR>==", "move text up" },
	},
	i = {
		["<M-j>"] = { "<Esc>:m .+1<CR>==gi", "move text down" },
		["<M-k>"] = { "<Esc>:m .-2<CR>==gi", "move text up" },
	},
	v = {
		["<M-j>"] = { ":m '>+1<CR>gv=gv", "move text down" },
		["<M-k>"] = { ":m '<-2<CR>gv=gv", "move text up" },
	},
}

M.easyAlign = {
	n = {
		["ga"] = { "<Plug>(EasyAlign)", "easy align" },
	},
	v = {
		["ga"] = { "<Plug>(EasyAlign)", "easy align" },
	},
}

M.indentVisual = {
	v = {
		["<"] = { "<gv", "indent left" },
		[">"] = { ">gv", "indent right" },
	},
}

M.escape = {
	i = {
		["jk"] = { "<Esc>", "escape" },
	},
}

M.dap = {
	n = {
		["<F5>"] = { ":lua require('dap').continue()<CR>", "dap start" },
		["<F6>"] = { ":lua require('dap').step_over()<CR>", "dap step over" },
		["<F7>"] = { ":lua require('dap').step_into()<CR>", "dap step into" },
		["<F8>"] = { ":lua require('dap').step_out()<CR>", "dap step out" },
		["<leader>b"] = { ":lua require('dap').toggle_breakpoint()<CR>", "dap toggle breakpoint" },
		["<leader>B"] = {
			":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"dap set breakpoint",
		},
		["<leader>lp"] = {
			":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			"dap log point",
		},
		["<leader>dr"] = { ":lua require('dap').repl.open()<CR>", "dapui repl" },
		["<leader>du"] = { ":lua require('dapui').toggle()<CR>", "dapui toggle" },
	},
}

return M
