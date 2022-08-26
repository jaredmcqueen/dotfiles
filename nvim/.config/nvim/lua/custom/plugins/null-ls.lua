local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.code_actions.shellcheck,
		require("null-ls").builtins.diagnostics.golangci_lint,
		require("null-ls").builtins.diagnostics.jsonlint,
		require("null-ls").builtins.diagnostics.markdownlint,
		require("null-ls").builtins.diagnostics.misspell,
		require("null-ls").builtins.diagnostics.php,
		require("null-ls").builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
		require("null-ls").builtins.diagnostics.yamllint,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.gofumpt,
		require("null-ls").builtins.formatting.goimports,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
		if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
			vim.diagnostic.disable(bufnr)
			vim.defer_fn(function()
				vim.diagnostic.reset(nil, bufnr)
			end, 1000)
		end
	end,
})
