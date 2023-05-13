return {
    {
        'neovim/nvim-lspconfig',
        -- event = { 'BufReadPre', 'BufNewFile' },
        lazy = false,
        dependencies = {
            'nvim-cmp',
            'nvim-treesitter',
            'Maan2003/lsp_lines.nvim',
            { 'williamboman/mason.nvim',      build = ':MasonUpdate' },
            { 'williamboman/mason-lspconfig', version = '1.3.0' },
        },
        config = function()
            require('mason').setup()

            require('mason-lspconfig').setup({
                automatic_installation = true,
                ensure_installed = { 'rust_analyzer' }
            })

            local handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            }

            require('mason-lspconfig').setup_handlers(handlers)

            --  docker_compose_language_service, jsonls, marksman, yamlls, awk_ls, solargraph, bashls, dockerls, clangd, lua_ls, vimls, rust_analyzer, html, cssls

            -- require('lspconfig').docker_compose_language_service.setup({})
            -- require('lspconfig').jsonls.setup({})
            -- require('lspconfig').marksman.setup({})
            -- require('lspconfig').yamlls.setup({})
            -- require('lspconfig').awk_ls.setup({})
            -- require('lspconfig').solargraph.setup({})
            -- require('lspconfig').bashls.setup({})
            -- require('lspconfig').dockerls.setup({})
            -- require('lspconfig').clangd.setup({})
            -- require('lspconfig').lua_ls.setup({})
            -- require('lspconfig').vimls.setup({})
            -- require('lspconfig').rust_analyzer.setup({})
            -- require('lspconfig').html.setup({})
            -- require('lspconfig').cssls.setup({})

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
                severity_sort = { reverse = true },
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
        end
    },

    {
        'jay-babu/mason-null-ls.nvim',
        lazy = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'mason.nvim',
            {
                'jose-elias-alvarez/null-ls.nvim',
                dependencies = { 'plenary.nvim' },
            }
        },
        config = function()
            require('mason-null-ls').setup({
                automatic_setup = true,
            })
        end
    },

}
