return {
    {
        'hrsh7th/nvim-cmp',
        version = false,
        dependencies = {
            'onsails/lspkind.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            local cmp = require 'cmp'
            cmp.setup({
                snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end, },
                formatting = {
                    format = require('lspkind').cmp_format({ mode = "text_symbol" })
                },
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.complete(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-c>'] = cmp.mapping.abort(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'buffer' },
                })
            })

            cmp.setup.cmdline({ '/', '?' }, {
                view = {
                    entries = {
                        name = 'wildmenu',
                        separator = '|',
                        selection_order = 'near_cursor',
                    }
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = 'buffer' } }
            })

            cmp.setup.cmdline(':', {
                view = {
                    entries = {
                        name = 'wildmenu',
                        separator = '|',
                        selection_order = 'near_cursor',
                    }
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
        end
    },
}
