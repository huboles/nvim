return {
    { 'tpope/vim-repeat',     event = "VeryLazy" },
    { 'tpope/vim-surround',   event = "VeryLazy" },
    { 'tpope/vim-endwise',    event = "VeryLazy" },
    { 'tpope/vim-commentary', event = "VeryLazy" },
    {
        'tpope/vim-fugitive',
        keys = {
            { '<leader>gg', '<CMD>Git<CR>' },
            { '<leader>gc', '<CMD>Git commit<CR>' },
            { '<leader>ga', '<CMD>Git add %<CR>' },
            { '<leader>gd', '<CMD>Gdiffsplit<CR>' },
            { '<leader>gb', '<CMD>Git blame<CR>' },
            { '<leader>gp', '<CMD>Git push<CR>' },
        },
    },
}
