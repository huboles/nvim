return {
    { 'christoomey/vim-tmux-navigator',      lazy = false },
    { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },

    {
        'j-hui/fidget.nvim',
        lazy = false,
        opts = {
            progress = {
                suppress_on_insert = true,
                ignore_empty_message = true,
            },
            notification = {
                view = {
                    stack_upwards = false,
                },
                window = {
                    align = "top",
                },
            },
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
