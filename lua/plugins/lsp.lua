return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "mason.nvim",
            "nvim-cmp",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            diagnostics = {
                virtual_text = false,
                virtual_lines = true,
                signs = false,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            }
        },
        setup = {}
    },

    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { 
                "c",
                "bash",
                "comment",
                "html", 
                "json",
                "markdown",
                "rust", 
                "regex",
                "ruby"
            },
            sync_install = true,
            auto_install = true,
            highlight = { enable = true, additional_vim_regex_highlighting = true, },
            indent = { enable = false },
        }
    },

    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
            },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason.nvim" },
        opts = function()
        local nls = require("null-ls")
        return {
            root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
            sources = {
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.shfmt,
            },
        }
        end
    },
}
