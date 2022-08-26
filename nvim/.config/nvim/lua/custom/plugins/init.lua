return {
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	["kylechui/nvim-surround"] = {
		config = function()
			require("nvim-surround").setup()
		end,
	},
	-- helm charts
	["towolf/vim-helm"] = {},
	["junegunn/vim-easy-align"] = {},
	["junegunn/vim-peekaboo"] = {},
	["ray-x/lsp_signature.nvim"] = {
		config = function()
			require("lsp_signature").setup()
		end,
	},
	["simrat39/symbols-outline.nvim"] = {
		config = function()
			require("symbols-outline").setup({})
		end,
	},
	["nvim-treesitter/nvim-treesitter-context"] = {
		config = function()
			require("treesitter-context").setup({
				patterns = {
					default = {
						"class",
						"function",
						"method",
						"for",
						"while",
						"if",
						"switch",
						"case",
					},
				},
			})
		end,
	},
}
