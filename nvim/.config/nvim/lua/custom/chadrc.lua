local M = {}
local override = require("custom.override")

M.plugins = {
	override = {
		["kyazdani42/nvim-tree.lua"] = override.nvimtree,
		["nvim-treesitter/nvim-treesitter"] = override.treesitter,
		["lukas-reineke/indent-blankline.nvim"] = override.blankline,
		["williamboman/mason.nvim"] = override.mason,
	},
	user = require("custom.plugins"),
}

M.ui = {
	theme = "onedark",
	hl_override = {
		CursorLine = { bg = "#1d1e29" },
	},
	changed_themes = {
		tokyonight = {
			base_16 = {
				base00 = "#0b0e14",
			},
		},
		onedark = {
			base_16 = {
				base00 = "#0b0e14",
			},
		},
	},
}

M.mappings = require("custom.mappings")

return M
