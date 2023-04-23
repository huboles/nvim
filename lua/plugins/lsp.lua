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
            vim.lsp.diagnostics = {
                virtual_text = false,
                virtual_lines = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            }

            local lspconfig = require('lspconfig')
            require('mason').setup()

            require('mason-lspconfig').setup({
                automatic_installation = true,
                ensure_installed = {}
            })

            require('mason-lspconfig').setup_handlers({
                function (server_name)
                    lspconfig[server_name].setup({})
                end
            })

            local border = {
                {"┌", "FloatBorder"},
                {"─", "FloatBorder"},
                {"┐", "FloatBorder"},
                {"│", "FloatBorder"},
                {"┘", "FloatBorder"},
                {"─", "FloatBorder"},
                {"└", "FloatBorder"},
                {"│", "FloatBorder"},
            }

            -- To instead override globally
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end
    },
}
