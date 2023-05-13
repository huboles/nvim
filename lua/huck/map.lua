-- movement enhancers
vim.keymap.set('n', '<LEADER><SPACE>', '<CMD>bprev<CR>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<LEADER>w', 'za')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

-- quick redo last macro
vim.keymap.set('n', 'Q', '@@')

-- useful ex (:) commands
vim.keymap.set('n', '<LEADER>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<LEADER>c', ':r!')
vim.keymap.set('n', '<LEADER>h', ":vsplit ")
vim.keymap.set('n', '<LEADER>v', ":split ")
vim.keymap.set('n', '<LEADER>t', ':tabnew ')

-- better line editing
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'H', 'i<CR><ESC>zzO')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'L', 'i<CR><ESC>zzi')
vim.keymap.set('n', 'K', 'Jx')

-- quick config editing
vim.keymap.set('n', '<LEADER>=', '<CMD>tabnew ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<LEADER>q', '<CMD>Lazy<CR>')
vim.keymap.set('n', '<LEADER>Q', '<CMD>so<CR>')

-- better terminal movement keys
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- lsp diagnostics
vim.keymap.set('n', '<LEADER>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<LEADER>p', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<LEADER>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<LEADER>a', vim.lsp.buf.code_action)
vim.keymap.set('n', '<LEADER>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<LEADER>K', vim.diagnostic.open_float)

-- toggle lsp diagnostics
vim.keymap.set('n', '<LEADER>d',
    function()
        if vim.g.visible_diagnostics then
            vim.diagnostic.disable()
            vim.g.visible_diagnostics = false
        else
            vim.diagnostic.enable()
            vim.g.visible_diagnostics = true
        end
    end
)

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
