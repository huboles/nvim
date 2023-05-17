return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('nvim-treesitter.configs').setup {
                sync_install = true,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = false },
            }
        end
    },
}
