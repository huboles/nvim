return {

    {
        'mbbill/undotree',
        keys = { { '<leader>u', '<CMD>UndotreeToggle<CR>', desc = 'Toggle undo tree sidebar' } }
    },

    { 'christoomey/vim-tmux-navigator', lazy = false },

    { 'tpope/vim-obsession', lazy = false },
    { 'tpope/vim-repeat', event = "VeryLazy" },
    { 'tpope/vim-surround', event = "VeryLazy" },
    { 'tpope/vim-endwise', event = "VeryLazy" },
    { 'tpope/vim-commentary',event = "VeryLazy" },

    { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },

    -- {
    --     'norcalli/nvim-colorizer.lua',
    --     lazy = false,
    --     config = function()
    --         require('colorizer').setup()
    --     end
    -- },

    {
        'junegunn/fzf',
        keys = {
            { '<leader>H', "<CMD>call fzf#run({ 'sink': 'vertical botright split', 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true} })<CR>" },
            { '<leader>V', "<CMD>call fzf#run({ 'sink': 'botright split', 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true}  })<CR>" },
            {'<leader>T', "<CMD>call fzf#run({ 'sink': 'tabnew', 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true} })<CR>"},
        },
    },

    {
        'junegunn/fzf.vim',
        dependencies = {'fzf'},
        keys = {
            { '<leader>f', '<CMD>GFiles<CR>' },
            { '<leader>F', '<CMD>Files<CR>' },
            { '<leader>b', '<CMD>Buffers<CR>' },
            { '<leader><C-r>', '<CMD>History:<CR>' },
        },
    },

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
            { '<leader>l', '<CMD>TroubleToggle<CR>' },
        },
        opts = {
            icons = false,
            mode = 'workspace_diagnostics',
            use_diagnostic_signs = true
        }
    }

}
