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
            { '<C-_>',       '<CMD>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>' },
            { '<C-r>',       '<CMD>Telescope command_history<CR>' },
            { '<LEADER>b',   '<CMD>Telescope buffers<CR>' },
            { '<LEADER>tt',  '<CMD>Telescope resume<CR>' },
            { '<LEADER>tc',  '<CMD>Telescope commands<CR>' },
            { '<LEADER>th',  '<CMD>Telescope help_tags<CR>' },
            { '<LEADER>tm',  '<CMD>Telescope marks<CR>' },
            { '<LEADER>tq',  '<CMD>Telescope quickfix<CR>' },
            { '<LEADER>ts',  '<CMD>Telescope search_history<CR>' },
            { '<LEADER>tr',  '<CMD>Telescope registers<CR>' },
            { '<LEADER>tk',  '<CMD>Telescope keymaps<CR>' },
            { '<LEADER>to',  '<CMD>Telescope vim_options<CR>' },
            { '<LEADER>tgc', '<CMD>Telescope git_commits<CR>' },
            { '<LEADER>tgd', '<CMD>Telescope git_bcommits<CR>' },
            { '<LEADER>tgb', '<CMD>Telescope git_branches<CR>' },
            { '<LEADER>tgs', '<CMD>Telescope git_status<CR>' },
            { '<LEADER>tft', '<CMD>Telescope filetypes<CR>' },
            { '<LEADER>ll',  '<CMD>Telescope diagnostics<CR>' },
            { '<LEADER>lr',  '<CMD>Telescope lsp_references<CR>' },
            { '<LEADER>lt',  '<CMD>Telescope lsp_type_definitions<CR>' },
            { '<LEADER>ld',  '<CMD>Telescope lsp_definitions<CR>' },
            { '<LEADER>li',  '<CMD>Telescope lsp_implementations<CR>' },
            { '<LEADER>ls',  '<CMD>Telescope lsp_document_symbols<CR>' },
            { '<LEADER>lS',  '<CMD>Telescope lsp_workspace_symbols<CR>' },
            { '<LEADER>tw', function()
                local word = vim.fn.expand("<cword>")
                require('telescope.builtin').grep_string({ search = word })
            end },
            { '<LEADER>tW', function()
                local word = vim.fn.expand("<cWORD>")
                require('telescope.builtin').grep_string({ search = word })
            end },
        },
        config = function()
            local actions = require('telescope.actions')
            require('telescope').setup {
                defaults = {
                    layout_strategy = 'horizontal',
                    layout_config = {
                        height = 0.9,
                        width = 0.9,
                    },
                    mappings = {
                        i = {
                            ['<ESC>'] = actions.close,
                            ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-n>'] = actions.preview_scrolling_down,
                            ['<C-p>'] = actions.preview_scrolling_up,
                            ['<C-h>'] = actions.select_vertical,
                            ['<C-v>'] = actions.select_horizontal,
                            ['<C-q>'] = actions.smart_add_to_qflist,
                        },
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

            -- live grep in git repo, or fall back to current directory
            vim.keymap.set('n', '<LEADER>F',
                function()
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

                    require("telescope.builtin").live_grep(opts)
                end
            )

            -- fuzzy search over git files, or fall back to all files
            vim.keymap.set('n', '<LEADER>f',
                function()
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
                end
            )

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
