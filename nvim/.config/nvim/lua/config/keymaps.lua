-- using function from https://www.lazyvim.org/configuration/general#keymaps
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jk", "<Esc>", { desc = "Escape normal mode" })
map("i", "<C-h>", "<Left>", { desc = "move left in insert mode" })
map("i", "<C-l>", "<Right>", { desc = "move right in insert mode" })

-- toggle inlay hints
map("n", "<leader>uh", function()
  vim.lsp.buf.inlay_hint(0, nil)
end, { desc = "Toggle inlay hints" })
