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
	["junegunn/vim-easy-align"] = {},
	["junegunn/vim-peekaboo"] = {},
	["ray-x/lsp_signature.nvim"] = {
		config = function()
			require("lsp_signature").setup()
		end,
	},
	["simrat39/symbols-outline.nvim"] = {
		config = function()
			require("symbols-outline").setup()
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
	["chentoast/marks.nvim"] = {
		config = function()
			require("marks").setup()
		end,
	},
	["leoluz/nvim-dap-go"] = {
		requires = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("dap-go").setup()
		end,
	},
	["rcarriga/nvim-dap-ui"] = {
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dapui").setup()
		end,
	},
	-- ["nvim-lua/plenary.nvim"] = {},
	-- ["sindrets/diffview.nvim"] = {
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	after = function()
	-- 		require("diffview").setup()
	-- 	end,
	-- },
}
