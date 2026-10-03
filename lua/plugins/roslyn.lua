return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        broad_search = true,
        lock_target = false,
    },
    config = function(_, opts)
        require("roslyn").setup(opts)
        vim.lsp.enable("roslyn")
    end,
}
