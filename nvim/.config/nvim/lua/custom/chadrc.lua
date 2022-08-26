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
	-- hl_override = {
	-- 	CursorLine = { bg = "#45475a" },
	-- },
}

M.mappings = require("custom.mappings")

return M
