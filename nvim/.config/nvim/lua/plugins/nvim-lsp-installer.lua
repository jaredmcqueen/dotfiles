local lsp_installer_servers = require("nvim-lsp-installer.servers")
local servers = {
    "bashls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "sqls",
    "sumneko_lua",
    "tailwindcss",
    "terraformls",
    "tsserver",
    "yamlls"
}
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(
            function()
                local opts = {
                    on_attach = require("configs.lsp-handler").on_attach,
                    capabilities = require("configs.lsp-handler").capabilities
                }
                -- merge additional options
                if server.name == "jsonls" then
                    local jsonls_opts = require("languages/jsonls")
                    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
                elseif server.name == "sumneko_lua" then
                    local lua_opts = require("languages/sumneko_lua")
                    opts = vim.tbl_deep_extend("force", lua_opts, opts)
                end
                server:setup(opts)
            end
        )
        if not server:is_installed() then
            server:install()
        end
    end
end
