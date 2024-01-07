return {
    { 'christoomey/vim-tmux-navigator',      lazy = false },
    { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },

    {
        'j-hui/fidget.nvim',
        lazy = false,
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
