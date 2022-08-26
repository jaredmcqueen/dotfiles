local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"bashls",
	"dockerls",
	"golangci_lint_ls",
	"gopls",
	"html",
	"intelephense",
	"jsonls",
	"pyright",
	"sqls",
	"sumneko_lua",
	"terraform_lsp",
	"tsserver",
	-- "yamlls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
