-- open certain windows in a vertical split
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*" },
    callback = function()
        local filetype = vim.o.filetype
        if filetype == "help" or filetype == "fugitive" or filetype == "gitcommit" then
            vim.cmd.wincmd("L")
        end
    end,
})

-- set filetype for .meta files
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.meta" },
    callback = function()
        vim.cmd.setfiletype("markdown")
    end,
})

-- set text width
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.md", "*.txt" },
    callback = function()
        vim.o.textwidth = 80
    end,
})

-- check template folder and if a template.[filetype] exists use it
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*" },
    callback = function()
        local ext = vim.fn.expand("%:e")
        local filename = vim.fn.expand("%:t")
        local dir = "/home/huck/repos/templates/"

        local copy = function(name)
            local path = dir .. name .. ext
            if vim.fn.filereadable(path) == 1 then
                vim.cmd("0r " .. path)
            end
        end

        if ext ~= "" then
            copy("template.")
        elseif filename == "Makefile" or filename == "LICENSE" then
            copy(filename)
        end
    end,
})
