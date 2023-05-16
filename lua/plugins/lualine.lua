return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "filename", path = 3 } },
            lualine_c = { "git", "branch", "diff" },
            lualine_x = { "encoding" },
            lualine_y = { "diagnostics" },
            lualine_z = { "location", "progress" },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = { { "filename", path = 3 } },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
        winbar = {
            lualine_a = { "filename", "filesize", "filetype" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    "tabs",
                    tabs_color = {
                        active = "StatusLine",
                        inactive = "StatusLineNC",
                    },
                },
            },
        },
        inactive_winbar = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "ObsessionStatus" },
        },
        extensions = {},
    },
}
