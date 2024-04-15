return {
    { 'tpope/vim-repeat',   event = "VeryLazy" },
    { 'tpope/vim-surround', event = "VeryLazy" },
    { 'tpope/vim-endwise',  event = "VeryLazy" },
    {
        'tpope/vim-fugitive',
        keys = {
            { '{LEADER}gg', '<CMD>Git<CR>' },
            { '<LEADER>gc', '<CMD>Git commit<CR>' },
            { '<LEADER>ga', '<CMD>Git add %<CR>' },
            { '<LEADER>gd', '<CMD>Gdiffsplit<CR>' },
            { '<LEADER>gb', '<CMD>Git blame<CR>' },
            { '<LEADER>gp', '<CMD>Git push<CR>' },
        },
    },
}
