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

local keybinds = function()
    vim.keymap.set('n', '<LEADER>n', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<LEADER>p', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<LEADER>r', vim.lsp.buf.rename)
    vim.keymap.set('n', '<LEADER>a', vim.lsp.buf.code_action)
    vim.keymap.set('n', '<LEADER>k', vim.lsp.buf.hover)
    vim.keymap.set('n', '<LEADER>K', vim.diagnostic.open_float)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition)

    -- toggle lsp diagnostics
    vim.keymap.set('n', '<LEADER>d',
        function()
            if vim.g.visible_diagnostics then
                vim.diagnostic.disable()
                vim.g.visible_diagnostics = false
            else
                vim.diagnostic.enable()
                vim.g.visible_diagnostics = true
            end
        end
    )
end

return {
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
                automatic_installation = false,
                ensure_installed = { "clangd", "lua_ls", "solargraph" },
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
            "Maan2003/lsp_lines.nvim",
        },
        config = function()
            -- servers to setup
            local lsp = require("lspconfig")

            lsp.clangd.setup({ on_attach = keybinds })
            lsp.solargraph.setup({ on_attach = keybinds })
            lsp.julials.setup({ on_attach = keybinds })
            lsp.texlab.setup({ on_attach = keybinds })
            lsp.gopls.setup({ on_attach = keybinds })
            lsp.lua_ls.setup({
                on_attach = keybinds,
                settings = {
                    Lua = {
                        diagnostics = { globals = "vim" }
                    }
                }
            })

            -- don't override treesitter colors
            vim.highlight.priorities.semantic_tokens = 95

            -- diagnostic settings
            vim.diagnostic.config({
                underline = true,
                update_in_insert = false,
                severity_sort = { reverse = false },
                signs = {
                    enable = true,
                    text = {
                        [vim.diagnostic.severity.ERROR] = ">>",
                        [vim.diagnostic.severity.WARN] = "> ",
                        [vim.diagnostic.severity.HINT] = "- ",
                        [vim.diagnostic.severity.INFO] = "* ",
                    }
                }
            })

            local floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return floating_preview(contents, syntax, opts, ...)
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
        event = { "BufReadPost *.rs" },
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
                            border = border,
                            auto_focus = true,
                            max_width = nil,
                            max_height = nil,
                        }
                    },
                    server = {
                        standalone = false,
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
                            keybinds()
                            vim.keymap.set('n', '<LEADER>k', rust.hover_actions.hover_actions, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>a', rust.code_action_group.code_action_group, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>m', rust.expand_macro.expand_macro, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>c', rust.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
                            vim.keymap.set('n', '<LEADER>P', rust.parent_module.parent_module, { buffer = bufnr })
                        end
                    }
                }
            )

            -- auto format code on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*" },
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    },

    {
        'JuliaEditorSupport/julia-vim',
        event = { "BufReadPost *.jl" }
    },
}
