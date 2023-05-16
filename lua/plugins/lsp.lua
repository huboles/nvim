return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "plenary.nvim",
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
                            proselint = mason_null,
                            codespell = mason_null,
                            shellcheck = mason_null,
                            write_good = mason_null,
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
            local completion = null_ls.builtins.completion

            require("null-ls").setup({
                sources = {
                    completion.spell,
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
                ensure_installed = { "rust_analyzer", "clangd", "lua_ls", "solargraph" },
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
            -- lsp.sorbet.setup({})
            lsp.rust_analyzer.setup({})
            lsp.taplo.setup({})
            lsp.yamlls.setup({})

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

            vim.lsp.diagnostics = {
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = { reverse = false },
            }

            local signs = { Error = ">>", Warn = "> ", Hint = "- ", Info = "  " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end,
    },
}
