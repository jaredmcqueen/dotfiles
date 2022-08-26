local M = {}

M.nvimtree = {
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

-- M.cmp = {
-- 	mapping = {
-- 		["<C-y>"] = cmp.mapping.confirm({
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = false,
-- 		}),
-- 	},
-- }

M.treesitter = {
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"php",
		"vim",
		"yaml",
	},
}

M.blankline = {
	filetype_exclude = {
		"help",
		"terminal",
		"alpha",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"nvchad_cheatsheet",
		"lsp-installer",
		"",
	},
}

M.mason = {
	ensure_installed = {
		"bash-language-server",
		"css-lsp",
		"dockerfile-language-server",
		"emmet-ls",
		"gofumpt",
		"goimports",
		"golangci-lint",
		"golangci-lint-langserver",
		"golines",
		"gopls",
		"html-lsp",
		"intelephense",
		"json-lsp",
		"lua-language-server",
		"prettier",
		"pyright",
		"shellcheck",
		"shfmt",
		"sql-formatter",
		"sqls",
		"stylua",
		"terraform-ls",
		"typescript-language-server",
		"yaml-language-server",
	},
}

return M
