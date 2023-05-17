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

            -- give telescope window if opened with no command
            vim.api.nvim_create_autocmd('VimEnter', {
                pattern = '*',
                callback = function()
                local arg = vim.api.nvim_eval('argv(0)')
                if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
                    vim.defer_fn(function()
                        local function is_git_repo()
                            vim.fn.system("git rev-parse --is-inside-work-tree")
                            return vim.v.shell_error == 0
                        end
                        local function get_git_root()
                            local dot_git_path = vim.fn.finddir(".git", ".;")
                            return vim.fn.fnamemodify(dot_git_path, ":h")
                        end
                        local opts = {}
                        if is_git_repo() then
                            opts = {
                                cwd = get_git_root(),
                            }
                        end
                        require("telescope.builtin").find_files(opts)
                    end, 10)
                end
                end
            })
        end
    },
}
