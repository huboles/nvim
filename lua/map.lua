-- quick creation for splits, tabs, buffers
vim.keymap.set( 'n', '<leader>h', ":vsplit " )
vim.keymap.set( 'n', '<leader>v', ":split " )
vim.keymap.set( 'n', '<leader>t', ':tabnew ' )
vim.keymap.set( 'n', '<leader>B', '<CMD>bnext<CR>' )

-- move through virtual lines
vim.keymap.set( 'n', 'j', 'gj'  )
vim.keymap.set( 'n', 'k', 'gk'  )

-- quick redo last macro
vim.keymap.set( 'n', 'Q', '@@'  )

-- center the screen for movement commands
vim.keymap.set( 'n', '<space>', 'za'  )
vim.keymap.set( 'n', 'n', 'nzz'  )
vim.keymap.set( 'n', 'N', 'Nzz'  )
vim.keymap.set( 'n', '<C-f>', '<C-f>zz'  )
vim.keymap.set( 'n', '<C-b>', '<C-b>zz'  )
vim.keymap.set( 'n', '<C-o>', '<C-o>zz'  )
vim.keymap.set( 'n', '<C-i>', '<C-i>zz'  )

-- normal mode line splitting and joining
vim.keymap.set( 'n', 'H', 'i<CR><ESC>zzO'  )
vim.keymap.set( 'n', 'L', 'i<CR><ESC>zzi'  )
vim.keymap.set( 'n', 'K', 'Jx'  )

-- toggle ui elements
vim.keymap.set( 'n', '_', '<CMD>nohlsearch<CR>'  )

-- quick plugin editing
vim.keymap.set( 'n', '<leader>=', '<CMD>tabnew ~/.config/nvim/init.lua<CR>' )
vim.keymap.set( 'n', '<leader>q', '<CMD>Lazy<CR>' )

-- autosave
vim.keymap.set( 'i', '<ESC>', '<ESC><CMD>update<CR>'  )

-- better terminal movement keys
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

-- lsp diagnostic navigation
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
