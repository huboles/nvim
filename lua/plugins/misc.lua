return {
    { 'christoomey/vim-tmux-navigator',      lazy = false },
    { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },

    {
        'j-hui/fidget.nvim',
        lazy = false,
        opts = {
            suppress_on_insert = true,
        },
    },

    {
        'akinsho/toggleterm.nvim',
        keys = { { [[<LEADER>\]], '<CMD>ToggleTerm<CR>' } },
        opts = {
            shade_terminals = false,
            size = 10
        }
    },
}
