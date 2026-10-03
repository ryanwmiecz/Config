return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the main branch doesn't support lazy loading
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "c_sharp", "lua", "json", "xml", "html", "css",
            "javascript", "typescript", "yaml", "markdown", "bash",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- start() errors if there's no parser for this filetype, so pcall it
                local ok = pcall(vim.treesitter.start, args.buf)
                if ok then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
