return {
    { 
        'hrsh7th/nvim-cmp', 
        dependencies = {
            'onsails/lspkind.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        opts = function()
            local cmp = require('cmp')
            return {
                view = { entries = {name = 'custom', selection_order = 'near_cursor'} },
                formatting = { format= require('lspkind').cmp_format({ mode = 'symbol_text' }), },
                mapping = require('nvim-cmp').mapping.preset.insert({
                        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                        ['<C-p>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-n>'] = cmp.mapping.scroll_docs(4),
                        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),
                }),
                sources = cmp.config.sources({ 
                    { name = 'nvim_lsp' }, 
                    { name = 'path' }, 
                    { name = 'buffer' }
                }),
                cmdline(':', {
                    view = { entries = {name = 'wildmenu', separator = '|'} },
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
                })
            }
        end
    },
}
