vim.g.c_syntax_for_h = 1
vim.g.termdebug_wide = 1

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 4

vim.o.mousefocus = true
vim.o.mousemodel= 'extend'

vim.o.lazyredraw = true

vim.o.number = true 
vim.o.relativenumber = true 

vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = '> '

vim.o.ignorecase = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.history = 10000
vim.o.showmatch = true

vim.o.autochdir = true
vim.o.browsedir = 'buffer'
vim.o.cdhome = true

vim.o.wrapscan = true
vim.o.wildmenu = true
-- vim.o.wildignore = { '*.docx','*.jpg','*.png','*.pdf','*.pyc','*.exe','*.flv','*.img','*.xlsx' }

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftround = true

vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.cmdwinheight = 10

vim.o.backupdir = '/home/huck/.local/state/nvim/backup'
vim.o.undodir = '/home/huck/.local/state/nvim/undo'

vim.o.backup = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.undolevels = 2000
vim.o.undoreload = 2000

vim.o.autoread = true

vim.o.foldenable = true
vim.o.foldlevelstart = 5
vim.o.foldmethod = 'indent'
-- vim.o.foldmarker = { '-v-','-^-' }
-- vim.o.backspace = { 'indent','eol','start' }

vim.o.ttimeout = true
vim.o.ttimeoutlen = 1
vim.o.confirm = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.showtabline = 0
vim.o.termguicolors = true
-- vim.o.completeopt = { 'menu', 'menuone', 'noselect' }

vim.o.pumblend = 30
vim.o.pumwidth = 50

vim.o.jumpoptions = 'stack'
vim.o.so = 10
