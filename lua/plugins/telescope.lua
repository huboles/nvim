return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>f',     '<CMD>Telescope git_files<CR>' },
            { '<leader>F',     '<CMD>Telescope find_files<CR>' },
            { '<leader><C-f>', '<CMD>Telescope live_grep<CR>' },
            { '<leader>b',     '<CMD>Telescope buffers<CR>' },
            { '<leader><C-r>', '<CMD>Telescope command_history<CR>' },
            { '<leader>D',     '<CMD>Telescope diagnostics<CR>' },
            { '<leader>g',     '<CMD>Telescope git_commits<CR>' },
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    layout_strategy = 'horizontal',
                    layout_config = {
                        height = 0.9,
                        width = 0.9,
                    }
                },
                pickers = {},
                extensions = {},
            }
        end
    },
}
