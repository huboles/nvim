return {
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = {
                    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
            },
        },
        keys = {
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
                    },
                    mappings = {
                        i = { ["<ESC>"] = require('telescope.actions').close },
                    },
                },
                pickers = {},
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case',
                    }
                },
            }

            require('telescope').load_extension('fzf')
        end
    },
}
