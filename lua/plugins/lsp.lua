return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            severity_sort = true,
            update_in_insert = false,
        })

        -- Give every server nvim-cmp's completion capabilities
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        vim.lsp.enable("html")
        vim.lsp.enable("cssls")
        -- roslyn is enabled in plugins/roslyn.lua
    end,
}
