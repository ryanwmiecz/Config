local map = vim.keymap.set

-- LSP
map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map({ "n", "v" }, "<C-a>", vim.lsp.buf.code_action, { desc = "Show code actions" })

-- Diagnostics
map("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)
map("n", "gl", vim.diagnostic.open_float)

-- Formatting
map("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format current file" })
