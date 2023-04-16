-- quick creation for splits, tabs, buffers
vim.keymap.set( 'n', '<leader>h', ":vsplit " )
vim.keymap.set( 'n', '<leader>v', ":split " )
vim.keymap.set( 'n', '<leader>t', ':tabnew ' )
vim.keymap.set( 'n', '<leader>B', '<CMD>bnext<CR>' )

-- fzf bindings
vim.keymap.set( 'n', '<leader>H', "<CMD>call fzf#run({ 'sink': 'vertical botright split' })<CR>" )
vim.keymap.set( 'n', '<leader>V', "<CMD>call fzf#run({ 'sink': 'botright split' })<CR>" )
vim.keymap.set( 'n', '<leader>T', "<CMD>call fzf#run({ 'sink': 'tabnew' })<CR>" )
vim.keymap.set( 'n', '<leader>f', '<CMD>GFiles<CR>' )
vim.keymap.set( 'n', '<leader>F', '<CMD>Files<CR>' )
vim.keymap.set( 'n', '<leader>b', '<CMD>Buffers<CR>' )
vim.keymap.set( 'n', '<leader>r', '<CMD>History:<CR>' )

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
vim.keymap.set( 'n', '<leader>u', '<CMD>UndotreeToggle<CR>' )
vim.keymap.set( 'n', '<leader><Space>', '<CMD>ToggleTerm<CR>'  )

-- editing and reloading init.lua
vim.keymap.set( 'n', '<leader>=', '<CMD>tabnew ~/.config/nvim/init.lua<CR>' )
vim.keymap.set( 'n', '<leader>q', 
function()
    vim.cmd('write')
    vim.cmd('source ~/.config/nvim/init.lua')
end )

vim.keymap.set( 'n', '<leader>Q', 
function()
    vim.cmd('write')
    vim.cmd('source ~/.config/nvim/init.lua')
    vim.cmd('PlugUpdate')
end )

-- autosave
vim.keymap.set( 'i', '<ESC>', '<ESC><CMD>update<CR>'  )

-- better terminal movement keys
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

-- lsp diagnostic navigation
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', "<Leader>L", require("lsp_lines").toggle)
vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
