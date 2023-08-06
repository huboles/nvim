-- movement enhancers
vim.keymap.set('n', '<LEADER><SPACE>', '<C-^>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- center screen after movements
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- quick redo last macro
vim.keymap.set('n', 'Q', '@@')

-- undo and redo on same key
vim.keymap.set('n', 'U', '<C-r>')

-- useful ex (:) commands
vim.keymap.set('n', '<LEADER>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<LEADER>c', ':r!')
vim.keymap.set('n', '<LEADER>h', ":vsplit ")
vim.keymap.set('n', '<LEADER>v', ":split ")
vim.keymap.set('n', '<LEADER>-', '<CMD>setlocal spell spelllang=en_us<CR>')
vim.keymap.set('n', '<LEADER>w', '<CMD>set textwidth=80<CR>ggVGgq')

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
vim.keymap.set('n', '<LEADER>Q', '<CMD>source %<CR>')

-- better terminal movement keys
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- quickfix navigation
vim.keymap.set('n', '<C-n>', '<CMD>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<CMD>cprev<CR>')
