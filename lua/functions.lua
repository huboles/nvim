vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.txt" },
    callback = function() 
        if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
    end
})
