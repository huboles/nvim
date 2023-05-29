return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "plenary.nvim",
            "nvim-treesitter",
            {
                "jay-babu/mason-null-ls.nvim",
                dependencies = { "mason.nvim" },
                config = function()
                    local mason_null = function(source_name, methods)
                        require("mason-null-ls").default_setup(source_name, methods)
                    end

                    require("mason-null-ls").setup({
                        automatic_installation = true,
                        handlers = {
                            function()
                            end,
                            shellcheck = mason_null,
                            shellharden = mason_null,
                        },
                    })
                end,
            },
        },
        config = function()
            local null_ls = require("null-ls")
            local diagnostics = null_ls.builtins.diagnostics
            local formatting = null_ls.builtins.formatting
            local hover = null_ls.builtins.hover

            require("null-ls").setup({
                sources = {
                    diagnostics.todo_comments,
                    diagnostics.trail_space,
                    formatting.trim_whitespace,
                    formatting.trim_newlines,
                    hover.dictionary,
                    hover.printenv,
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig",
        dependencies = {
            "nvim-treesitter",
            {
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
                config = function()
                    require("mason").setup()
                end,
            },
        },
        version = "1.3.0",
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = { "rust_analyzer", "clangd", "lua_ls" },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        lazy = false,
        dependencies = {
            "mason-lspconfig",
            "nvim-cmp",
            "nvim-treesitter",
            "null-ls.nvim",
            "Maan2003/lsp_lines.nvim",
        },
        config = function()
            -- servers to setup
            local lsp = require("lspconfig")
            lsp.awk_ls.setup({})
            lsp.bashls.setup({})
            lsp.clangd.setup({})
            lsp.cssls.setup({})
            lsp.dockerls.setup({})
            lsp.docker_compose_language_service.setup({})
            lsp.html.setup({})
            lsp.jsonls.setup({})
            lsp.lua_ls.setup({})
            lsp.marksman.setup({})
            lsp.solargraph.setup({})
            lsp.rust_analyzer.setup({})
            lsp.taplo.setup({})
            lsp.yamlls.setup({})

            -- diagnostic settings
            vim.lsp.diagnostics = {
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = { reverse = false },
            }

            -- don't override treesitter colors
            vim.highlight.priorities.semantic_tokens = 95

            -- custom signs
            local signs = { Error = ">>", Warn = "> ", Hint = "- ", Info = "  " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- borders on windows
            local border = {
                { "┏", "FloatBorder" },
                { "━", "FloatBorder" },
                { "┓", "FloatBorder" },
                { "┃", "FloatBorder" },
                { "┛", "FloatBorder" },
                { "━", "FloatBorder" },
                { "┗", "FloatBorder" },
                { "┃", "FloatBorder" },
            }

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- auto format code on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*" },
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end,
    },
}
