-- Search C# files in the current project's Unity PackageCache
local function search_package_cache()
    local package_cache = vim.fn.getcwd() .. "/Library/PackageCache"

    if vim.fn.isdirectory(package_cache) == 0 then
        vim.notify("PackageCache not found: " .. package_cache, vim.log.levels.WARN)
        return
    end

    require("telescope.builtin").find_files({
        prompt_title = "PackageCache C# Scripts",
        cwd = package_cache,
        find_command = { "rg", "--files", "--hidden", "--no-ignore", "-g", "*.cs" },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end },
        { "<leader>fb", function() require("telescope.builtin").buffers() end },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end },

        { "<leader>fc", function()
            require("telescope.builtin").find_files({
                prompt_title = "C# Scripts",
                find_command = { "rg", "--files", "-g", "*.cs" },
            })
        end },

        { "<leader>fj", function()
            require("telescope.builtin").grep_string({
                search = vim.fn.input("Search JSON: "),
                glob_pattern = "*.json",
            })
        end },

        { "<leader>ft", function()
            require("telescope.builtin").grep_string({
                search = vim.fn.input("Search C#: "),
                glob_pattern = "*.cs",
            })
        end },

        { "<leader>pc", search_package_cache, desc = "Search PackageCache" },

        -- CHANGE this path for this machine
        { "<leader>fa", function()
            require("telescope.builtin").find_files({
                prompt_title = "C# Scripts (All Projects)",
                cwd = vim.fn.expand("~/Development/pst/ams-apps"),
                find_command = { "rg", "--files", "-g", "*.cs" },
            })
        end },
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "Library/", "Temp/", "Logs/", "Obj/", "Build/" },
        },
    },
}
