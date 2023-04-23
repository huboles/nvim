vim.o.background = "dark"

local black        = "#151515"
local red          = "#e84f4f"
local green        = "#b8d68c"
local yellow       = "#e1aa5d"
local blue         = "#7dc1cf"
local purple       = "#9b64fb"
local pink         = "#6d878d"
local white        = "#d7d0c7"

local dark_grey    = "#333333"
local grey         = "#888888"
local light_grey   = "#aaaaaa"

local dark_red     = "#d23d3d"
local dark_green   = "#a0cf5d"
local dark_yellow  = "#f39d21"
local dark_blue    = "#4e9fb1"
local dark_purple  = "#8542ff"
local dark_pink    = "#42717b"
local dark_white   = "#f7f0dd"

local c_black        = "0"
local c_red          = "1"
local c_green        = "2"
local c_yellow       = "3"
local c_blue         = "4"
local c_purple       = "5"
local c_pink         = "6"
local c_white        = "7"
local c_grey         = "8"
local c_dark_red     = "9"
local c_dark_green   = "10"
local c_dark_yellow  = "11"
local c_dark_blue    = "12"
local c_dark_purple  = "13"
local c_dark_pink    = "14"

vim.g.terminal_color_0 = black
vim.g.terminal_color_1 = red
vim.g.terminal_color_2 = green
vim.g.terminal_color_3 = yellow
vim.g.terminal_color_4 = blue
vim.g.terminal_color_5 = purple
vim.g.terminal_color_6 = pink
vim.g.terminal_color_7 = white
vim.g.terminal_color_8 = grey
vim.g.terminal_color_9 = dark_red
vim.g.terminal_color_10 = dark_green
vim.g.terminal_color_11 = dark_yellow
vim.g.terminal_color_12 = dark_blue
vim.g.terminal_color_13 = dark_purple
vim.g.terminal_color_14 = dark_pink
vim.g.terminal_color_15 = dark_white

local bold = "bold"
local italic = "italic"
local underline = "underline"

local function highlight(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
    local parts = { group }
    if guifg then table.insert(parts, "guifg="..guifg) end
    if guibg then table.insert(parts, "guibg="..guibg) end
    if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
    if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
    if attr then
        table.insert(parts, "gui="..attr)
        table.insert(parts, "cterm="..attr)
    end
    if guisp then table.insert(parts, "guisp="..guisp) end
    vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end

-- highlight(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)

-- Attributes
highlight("Bold", nil, nil, nil, nil, bold, nil)
highlight("Italic", nil, nil, nil, nil, italic, nil)
highlight("Underline", nil, nil, nil, nil, underline, nil)

-- Editor
highlight("Normal", white, black, c_white, nil, nil, nil)
highlight("EndOfBuffer", black, black, c_black, c_black, nil, nil)
highlight("LineNr", yellow, black, c_yellow, c_black, nil, nil)
highlight("CursorLineNr", red, black, c_red, c_black, bold, nil)
highlight("MatchParen", nil, grey, nil, c_grey, bold, nil)
highlight("SpecialKey", pink, nil, c_pink, nil, nil, nil)
highlight("NonText", pink, black, c_pink, c_black, nil, nil)
highlight("Search", nil, green, nil, c_green, nil, nil)
highlight("Visual", nil, dark_grey, nil, c_grey, nil, nil)
highlight("Folded", blue, dark_grey, c_blue, c_grey, nil, nil)
highlight("FoldColumn", blue, dark_grey, c_blue, c_grey, nil, nil)

-- UI
highlight("WildMenu", grey, black, c_grey, c_black, nil, nil)
highlight("Title", green, black, c_green, c_black, bold, nil)
highlight("ToolBarLine", black, dark_grey, c_black, c_grey, nil, nil)
highlight("Pmenu", white, black, nil, c_black, nil, nil)
highlight("PmenuSbar", white, black, nil, c_black, nil, nil)
highlight("PmenuThumb", grey, black, nil, c_black, nil, nil)
highlight("PmenuSel", green, black, c_green, c_black, nil, nil)
highlight("VertSplit", dark_grey, black, c_grey, nil, nil)
highlight("FloatBorder", dark_grey, black, c_grey, c_black, nil, nil)
highlight("TabLine", black, grey, c_black, c_grey, nil, nil)
highlight("TabLineFill", grey, black, c_grey, c_black, nil, nil)
highlight("TablineSel", grey, black, c_grey, c_white, bold, nil)
highlight("StatusLineNC", grey, black, c_grey, nil, bold, nil)
highlight("StatusLine", white, black, c_grey, c_white, bold, nil)
highlight("SignColumn", blue, black, c_blue, c_black, nil, nil)
highlight("ColorColumn", black, dark_yellow, c_black, c_dark_yellow, nil, nil)
highlight("Directory", blue, nil, c_blue, nil, bold, nil)
highlight("Conceal", grey, black, c_grey, c_black, nil, nil)
highlight("CursorLine", white, grey, c_white, c_grey, nil, nil)

-- Spelling
highlight("SpellBad", red, black, c_red, c_black, underline, red)
highlight("SpellCap", pink, black, c_pink, c_black, underline, pink)
highlight("SpellRare", green, black, c_green, c_black, underline, green)
highlight("SpellLocal", purple, black, c_purple, c_black, underline, purple)

-- Messages
highlight("Question", green, black, c_green, c_black, nil, nil)
highlight("Error", black, red, c_black, c_red, nil, nil)
highlight("ErrorMsg", red, black, c_red, c_black, underline, nil)
highlight("WarningMsg", yellow, black, c_yellow, c_black, underline, nil)
highlight("Todo", black, dark_yellow, c_black, c_dark_yellow, bold, nil)
highlight("MoreMsg", green, black, c_green, c_black, bold, nil)
highlight("NvimInternalError", black, dark_red, c_black, c_dark_red, nil, nil)

-- LSP
highlight("DiagnosticError", dark_red, black, c_dark_red, c_black, nil, nil)
highlight("DiagnosticWarn", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("DiagnosticInfo", dark_blue, black, c_dark_blue, c_black, nil, nil)
highlight("DiagnosticHint", grey, black, c_grey, c_black, nil, nil)
highlight("DiagnosticUnderlineError", nil, nil, nil, nil, underline, dark_red)
highlight("DiagnosticUnderlineWarn", nil, nil, nil, nil, underline, dark_yellow)
highlight("DiagnosticUnderlineInfo", nil, nil, nil, nil, underline, dark_blue)
highlight("DiagnosticUnderlineHint", nil, nil, nil, nil, underline, grey)

-- Completion
highlight("CmpItemAbbrMatch", dark_blue, "NONE", c_dark_blue, "NONE", nil, nil)
highlight("CmpItemAbbrMatchFuzzy", blue, "NONE", c_blue, "NONE", nil, nil)
highlight("CmpItemKindVariable", green, "NONE", c_green, "NONE", nil, nil)
highlight("CmpItemKindInterface", dark_pink, "NONE", c_dark_pink, "NONE", nil, nil)
highlight("CmpItemKindText", pink, "NONE", c_pink, "NONE", nil, nil)
highlight("CmpItemKindFunction", purple, "NONE", c_purple, "NONE", nil, nil)
highlight("CmpItemKindMethod", purple, "NONE", c_purple, "NONE", nil, nil)
highlight("CmpItemKindKeyword", dark_yellow, "NONE", c_dark_yellow, "NONE", nil, nil)
highlight("CmpItemKindProperty", dark_yellow, "NONE", c_dark_yellow, "NONE", nil, nil)
highlight("CmpItemKindUnit", dark_yellow, "NONE", c_dark_yellow, "NONE", nil, nil)

-- Indent lines
highlight("IndentBlanklineChar", dark_grey, nil, c_grey, nil, "NONE", nil)
highlight("IndentBlanklineSpaceChar", dark_grey, nil, c_grey, nil, "NONE", nil)
highlight("IndentBlanklineSpaceCharBlankline", dark_grey, nil, c_grey, nil, "NONE", nil)

-- Syntax highlighting
highlight("Comment", grey, black, c_grey, c_black, italic, nil)

highlight("Constant", dark_purple, black, c_dark_purple, c_black, nil, nil)
highlight("String", white, black, c_white, c_black, italic, nil)
highlight("Number", white, black, c_white, c_black, bold, nil)
highlight("Float", white, black, c_white, c_black, bold, nil)
highlight("Character", white, black, c_white, c_black, bold, nil)
highlight("Boolean", dark_purple, black, c_dark_purple, c_black, bold, nil)

highlight("Function", dark_blue, black, c_dark_blue, c_black, bold, nil)
highlight("Identifier", blue, black, c_blue, c_black, nil, nil)

highlight("Conditional", dark_green, black, c_dark_green, c_black, "italic,bold", nil)
highlight("Repeat", dark_green, black, c_dark_green, c_black, "italic,bold", nil)

highlight("Label", dark_green, black, c_dark_green, c_black, nil, nil)
highlight("Statement", dark_green, black, c_dark_green, c_black, nil, nil)
highlight("Operator", dark_green, black, c_dark_green, c_black, bold, nil)
highlight("Keyword", dark_green, black, c_dark_green, c_black, bold, nil)

highlight("PreProc", yellow, black, c_yellow, c_black, bold, nil)
highlight("Include", yellow, black, c_yellow, c_black, bold, nil)
highlight("Define", yellow, black, c_yellow, c_black, bold, nil)
highlight("Macro", dark_yellow, black, c_dark_yellow, c_black, bold, nil)
highlight("PreCondit", yellow, black, c_yellow, c_black, bold, nil)

highlight("Type", blue, black, c_blue, c_black, bold, nil)
highlight("Structure", blue, black, c_blue, c_black, bold, nil)
highlight("StorageClass", green, black, c_green, c_black, bold, nil)
highlight("TypeDef", green, black, c_green, c_black, bold, nil)

highlight("Special", dark_yellow, black, c_dark_yellow, c_black, bold, nil)
highlight("SpecialChar", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("Delimiter", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("SpecialComment", yellow, black, c_yellow, c_black, italic, nil)
highlight("Debug", dark_yellow, black, c_dark_yellow, c_black, nil, nil)

-- Diff
highlight("DiffAdd", black, green, c_black, c_green, nil, nil)
highlight("DiffText", black, pink, c_black, c_pink, nil, nil)
highlight("DiffDelete", black, red, c_black, c_red, nil, nil)
highlight("DiffChange", black, purple, c_black, c_purple, nil, nil)

-- Redraw
highlight("RedrawDebugNormal", black, white, c_black, c_white, nil, nil)
highlight("RedrawDebugClear", black, dark_yellow, c_black, c_dark_yellow, nil, nil)
highlight("RedrawDebugComposed", black, green, c_black, c_green, nil, nil)
highlight("RedrawDebugRecompose", black, red, c_black, c_red, nil, nil)

-- Lazy.nvim
highlight("LazyButton", white, black, c_white, c_black, nil, nil)
highlight("LazyButtonActive", white, black, c_white, c_black, bold, nil)
highlight("LazyH1", white, black, c_white, c_black, bold, nil)

-- Lualine
highlight("lualine_a_visual", black, yellow, c_black, c_yellow, nil, nil)
highlight("lualine_b_visual", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_visual", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_a_replace", black, purple, c_black, c_purple, nil, nil)
highlight("lualine_b_replace", purple, black, c_purple, c_black, nil, nil)
highlight("lualine_c_replace", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_a_normal", white, black, c_white, c_black, nil, nil)
highlight("lualine_b_normal", white, black, c_white, c_black, nil, nil)
highlight("lualine_c_normal", white, black, c_white, c_black, nil, nil)
highlight("lualine_a_command", black, blue, c_black, c_blue, nil, nil)
highlight("lualine_b_command", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_c_command", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_a_insert", black, green, c_black, c_green, nil, nil)
highlight("lualine_b_insert", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_insert", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_a_terminal", black, pink, c_black, c_pink, nil, nil)
highlight("lualine_b_terminal", pink, black, c_pink, c_black, nil, nil)
highlight("lualine_c_terminal", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_a_inactive", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_b_inactive", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_inactive", grey, black, c_grey, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_normal", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_normal", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_normal", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_normal", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_normal", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_normal", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_normal", blue, black, c_blue, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_insert", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_insert", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_insert", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_insert", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_insert", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_insert", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_insert", blue, black, c_blue, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_visual", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_visual", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_visual", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_visual", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_visual", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_visual", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_visual", blue, black, c_blue, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_replace", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_replace", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_replace", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_replace", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_replace", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_replace", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_replace", blue, black, c_blue, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_command", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_command", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_command", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_command", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_command", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_command", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_command", blue, black, c_blue, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_terminal", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_terminal", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_terminal", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_terminal", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_terminal", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_terminal", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_terminal", blue, black, c_blue, c_black, nil, nil)

highlight("lualine_y_diagnostics_error_inactive", red, black, c_red, c_black, nil, nil)
highlight("lualine_y_diagnostics_warn_inactive", dark_yellow, black, c_dark_yellow, c_black, nil, nil)
highlight("lualine_y_diagnostics_info_inactive", blue, black, c_blue, c_black, nil, nil)
highlight("lualine_y_diagnostics_hint_inactive", grey, black, c_grey, c_black, nil, nil)
highlight("lualine_c_diff_added_inactive", green, black, c_green, c_black, nil, nil)
highlight("lualine_c_diff_modified_inactive", yellow, black, c_yellow, c_black, nil, nil)
highlight("lualine_c_diff_removed_inactive", blue, black, c_blue, c_black, nil, nil)

