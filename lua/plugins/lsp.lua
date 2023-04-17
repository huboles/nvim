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
                signs = false,
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
        end
    },
}
