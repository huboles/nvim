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
            -- lsp.rust_analyzer.setup({
            --     settings = {
            --         ['rust-analyzer'] = {
            --             completion = {
            --                 privateEditable = true,
            --                 completionItem = {
            --                     preselectSupport = true,
            --                     snippetSupport = true,
            --                 }
            --             },
            --             hover = {
            --                 actions = {
            --                     enable = true,
            --                     references = true,
            --                 }
            --             },
            --             imports = {
            --                 granularity = {
            --                     enforce = true,
            --                 },
            --                 group = true,
            --                 prefix = "self",
            --             },
            --             inlayHints = {
            --                 closureCaptureHints       = true,
            --                 closureReturnTypeHints    = true,
            --                 lifetimeElisionHints      = true,
            --                 discriminantHints         = true,
            --                 expressionAdjustmentHints = { enable = true, mode = "postfix" },
            --                 closingBraceHints         = { enable = true, minLines = 1 },
            --             },
            --             highlightRelated = { enable = true },
            --             magicCompletions = { enable = true },
            --             procMacro = {
            --                 enable = true
            --             } }
            --     }
            -- })
            lsp.awk_ls.setup({})
            lsp.bashls.setup({})
            lsp.clangd.setup({})
            lsp.cssls.setup({})
            lsp.html.setup({})
            lsp.lua_ls.setup({})
            lsp.solargraph.setup({})

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

    {
        'simrat39/rust-tools.nvim',
        ft = "rust",
        config = function()
            local rust = require("rust-tools")

            rust.setup(
                {
                    tools = {
                        inlay_hints = {
                            only_current_line = true,
                            parameter_hints_prefix = "",
                            other_hints_prefix = "-> "
                        },
                        hover_actions = {
                            border = {
                                { "┏", "FloatBorder" },
                                { "━", "FloatBorder" },
                                { "┓", "FloatBorder" },
                                { "┃", "FloatBorder" },
                                { "┛", "FloatBorder" },
                                { "━", "FloatBorder" },
                                { "┗", "FloatBorder" },
                                { "┃", "FloatBorder" },
                            },
                            auto_focus = true
                        }
                    },
                    server = {
                        settings = {
                            ['rust-analyzer'] = {
                                completion = {
                                    callable = { snippets = "add_parentheses" }
                                },
                                hover = {
                                    actions = {
                                        references = { enable = true },
                                    }
                                },
                                imports = {
                                    granularity = { enforce = true }
                                },
                                inlay_hints = {
                                    closureReturnTypeHints = { enable = 'with_block' },
                                    lifetimeElisionHints = { enable = 'skip_trivial' },
                                }
                            }
                        },
                        on_attach = function(_, bufnr)
                            vim.keymap.set('n', '<LEADER>k', rust.hover_actions.hover_actions, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>a', rust.code_action_group.code_action_group, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>m', rust.expand_macro.expand_macro, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>c', rust.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>P', rust.parent_module.parent_module, { buffer = bufnr })
                        end
                    }
                }
            )
        end
    },
}
