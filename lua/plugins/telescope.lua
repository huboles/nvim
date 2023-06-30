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
            { '<leader>b',   '<CMD>Telescope buffers<CR>' },
            { '<leader>l',   '<CMD>Telescope diagnostics<CR>' },
            { '<leader>R',   '<CMD>Telescope lsp_references<CR>' },
            { '<leader>tt',  '<CMD>Telescope resume<CR>' },
            { '<leader>tc',  '<CMD>Telescope commands<CR>' },
            { '<leader>th',  '<CMD>Telescope help_tags<CR>' },
            { '<leader>tm',  '<CMD>Telescope marks<CR>' },
            { '<leader>tq',  '<CMD>Telescope quickfix<CR>' },
            { '<leader>ts',  '<CMD>Telescope search_history<CR>' },
            { '<leader>tr',  '<CMD>Telescope registers<CR>' },
            { '<leader>tk',  '<CMD>Telescope keymaps<CR>' },
            { '<leader>to',  '<CMD>Telescope vim_options<CR>' },
            { '<leader>tgc', '<CMD>Telescope git_commits<CR>' },
            { '<leader>tgd', '<CMD>Telescope git_bcommits<CR>' },
            { '<leader>tgb', '<CMD>Telescope git_branches<CR>' },
            { '<leader>tgs', '<CMD>Telescope git_status<CR>' },
            { '<leader>tft', '<CMD>Telescope filetypes<CR>' },
            { '<leader>tld', '<CMD>Telescope lsp_type_definitions<CR>' },
            { '<leader>tlt', '<CMD>Telescope lsp_definitions<CR>' },
            { '<leader>tli', '<CMD>Telescope lsp_implementations<CR>' },
            { '<leader>tls', '<CMD>Telescope lsp_document_symbols<CR>' },
            { '<leader>tlS', '<CMD>Telescope lsp_workspace_symbols<CR>' },
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
