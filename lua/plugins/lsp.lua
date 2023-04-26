return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'nvim-cmp',
            'nvim-treesitter',
            'Maan2003/lsp_lines.nvim',
            { 'williamboman/mason.nvim', build = ':MasonUpdate' },
            'williamboman/mason-lspconfig',
        },
        config = function()
            local lspconfig = require('lspconfig')
            require('mason').setup()

            require('mason-lspconfig').setup({
                automatic_installation = true,
                ensure_installed = {}
            })

            require('mason-lspconfig').setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end
            })

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

            local signs = { Error = ">>", Warn = "> ", Hint = "- ", Info = "  " }

            vim.lsp.diagnostics = {
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = { reverse = true },
            }

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
        event = { 'BufReadPre', 'BufNewFile' },
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
