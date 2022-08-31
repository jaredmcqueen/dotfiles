local M = {}
local pluginConfs = require("custom.plugins.configs")

M.plugins = {
	override = {
		["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
		["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
		["lukas-reineke/indent-blankline.nvim"] = pluginConfs.blankline,
		["williamboman/mason.nvim"] = pluginConfs.mason,
		["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
	},
	user = require("custom.plugins"),
}

M.ui = {
	theme = "catppuccin",
	hl_override = {
		Comment = { italic = true },
		CursorLine = { bg = "one_bg" },
	},
}

M.mappings = require("custom.mappings")

return M
