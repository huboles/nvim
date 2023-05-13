return {

    {
        'mbbill/undotree',
        keys = { { '<leader>u', '<CMD>UndotreeToggle<CR>' } }
    },

    { 'christoomey/vim-tmux-navigator',      lazy = false },

    { 'tpope/vim-obsession',                 lazy = false },
    { 'tpope/vim-repeat',                    event = "VeryLazy" },
    { 'tpope/vim-surround',                  event = "VeryLazy" },
    { 'tpope/vim-endwise',                   event = "VeryLazy" },
    { 'tpope/vim-commentary',                event = "VeryLazy" },
    { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },

    {
        'akinsho/toggleterm.nvim',
        keys = { { '<leader><space>', '<CMD>ToggleTerm<CR>' } },
        opts = {
            shade_terminals = false,
            size = 10
        }
    },

    {
        'folke/trouble.nvim',
        keys = {
            { '<leader>l', '<CMD>TroubleToggle document_diagnostics<CR>' },
            { '<leader>L', '<CMD>TroubleToggle workspace_diagnostics<CR>' },
            { '<leader>R', '<CMD>TroubleToggle lsp_references<CR>' },
        },
        opts = {
            icons = false,
            use_diagnostic_signs = true
        }
    }

}
