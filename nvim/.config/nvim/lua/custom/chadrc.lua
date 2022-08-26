local M = {}
local override = require("custom.override")

M.plugins = {
	override = {
		["kyazdani42/nvim-tree.lua"] = override.nvimtree,
		["nvim-treesitter/nvim-treesitter"] = override.treesitter,
		["lukas-reineke/indent-blankline.nvim"] = override.blankline,
		["williamboman/mason.nvim"] = override.mason,
		-- ["hrsh7th/nvim-cmp"] = override.cmp,
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
