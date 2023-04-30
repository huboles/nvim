-- quick creation for splits, tabs, buffers
vim.keymap.set('n', '<leader>h', ":vsplit ")
vim.keymap.set('n', '<leader>v', ":split ")
vim.keymap.set('n', '<leader>t', ':tabnew ')
vim.keymap.set('n', '<SPACE><SPACE>', '<CMD>bprev<CR>')

-- move through virtual lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- quick redo last macro
vim.keymap.set('n', 'Q', '@@')

-- center the screen for movement commands
vim.keymap.set('n', '<leader>w', 'za')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

-- normal mode line splitting and joining
vim.keymap.set('n', 'H', 'i<CR><ESC>zzO')
vim.keymap.set('n', 'L', 'i<CR><ESC>zzi')
vim.keymap.set('n', 'K', 'Jx')

-- toggle ui elements
vim.keymap.set('n', '_', '<CMD>nohlsearch<CR>')

-- quick plugin editing
vim.keymap.set('n', '<leader>=', '<CMD>tabnew ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>q', '<CMD>Lazy<CR>')

-- better terminal movement keys
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- lsp diagnostic navigation
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>d',
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
