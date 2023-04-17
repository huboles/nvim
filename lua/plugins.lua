return {

    'mbbill/undotree',

    { 'christoomey/vim-tmux-navigator', lazy = false },
    { 'norcalli/nvim-colorizer.lua', lazy = false },
    { 'lukas-reineke/indent-blankline.nvim', lazy = false },
    { 'tpope/vim-repeat', lazy = false },
    { 'tpope/vim-obsession', lazy = false },
    { 'tpope/vim-surround', lazy = false },
    { 'tpope/vim-endwise', lazy = false },
    { 'tpope/vim-commentary', lazy = false },

    {
        'junegunn/fzf.vim', 
        dependencies = {'junegunn/fzf'},
        lazy = false
    },

    {
        'akinsho/toggleterm.nvim',
        lazy = false,
        opts = {
            shade_terminals = false,
            size = 10
        }
    }
}
