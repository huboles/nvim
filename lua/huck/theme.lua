vim.o.background        = "dark"

local black             = "#151515"
local red               = "#e84f4f"
local green             = "#b8d68c"
local yellow            = "#e1aa5d"
local blue              = "#7dc1cf"
local magenta           = "#9b64fb"
local cyan              = "#6d878d"
local white             = "#d7d0c7"

local dark_grey         = "#333333"
local grey              = "#888888"
local light_grey        = "#aaaaaa"

local dark_red          = "#d23d3d"
local dark_green        = "#a0cf5d"
local dark_yellow       = "#f39d21"
local dark_blue         = "#4e9fb1"
local dark_magenta      = "#8542ff"
local dark_cyan         = "#42717b"
local dark_white        = "#f7f0dd"

vim.g.terminal_color_0  = black
vim.g.terminal_color_1  = red
vim.g.terminal_color_2  = green
vim.g.terminal_color_3  = yellow
vim.g.terminal_color_4  = blue
vim.g.terminal_color_5  = magenta
vim.g.terminal_color_6  = cyan
vim.g.terminal_color_7  = white
vim.g.terminal_color_8  = grey
vim.g.terminal_color_9  = dark_red
vim.g.terminal_color_10 = dark_green
vim.g.terminal_color_11 = dark_yellow
vim.g.terminal_color_12 = dark_blue
vim.g.terminal_color_13 = dark_magenta
vim.g.terminal_color_14 = dark_cyan
vim.g.terminal_color_15 = dark_white

local bold              = "bold"
local italic            = "italic"
local underline         = "underline"

local function highlight(group, guifg, guibg, attr, guisp)
    local parts = { group }
    if guifg then table.insert(parts, "guifg=" .. guifg) end
    if guibg then table.insert(parts, "guibg=" .. guibg) end
    if attr then table.insert(parts, "gui=" .. attr) end
    if guisp then table.insert(parts, "guisp=" .. guisp) end
    vim.api.nvim_command('highlight ' .. table.concat(parts, ' '))
end

-- highlight(group, guifg, guibg, attr, guisp)

-- attributes
highlight("Bold", nil, nil, bold, nil)
highlight("Italic", nil, nil, italic, nil)
highlight("Underline", nil, nil, underline, nil)

-- editor
highlight("Normal", white, black, nil, nil)
highlight("EndOfBuffer", black, black, nil, nil)
highlight("LineNr", yellow, black, nil, nil)
highlight("CursorLineNr", red, black, bold, nil)
highlight("MatchParen", nil, grey, bold, nil)
highlight("SpecialKey", cyan, nil, nil, nil)
highlight("NonText", cyan, black, nil, nil)
highlight("Search", black, green, nil, nil)
highlight("CurSearch", black, yellow, nil, nil)
highlight("Visual", nil, dark_grey, nil, nil)
highlight("Folded", blue, dark_grey, nil, nil)
highlight("FoldColumn", blue, dark_grey, nil, nil)

-- ui
highlight("WildMenu", grey, black, nil, nil)
highlight("Title", green, black, bold, nil)
highlight("ToolBarLine", black, dark_grey, nil, nil)
highlight("Pmenu", white, black, nil, nil)
highlight("PmenuSbar", white, black, nil, nil)
highlight("PmenuThumb", grey, black, nil, nil)
highlight("PmenuSel", green, black, nil, nil)
highlight("VertSplit", dark_grey, black, nil)
highlight("FloatBorder", dark_grey, black, nil, nil)
highlight("TabLine", black, grey, nil, nil)
highlight("TabLineFill", grey, black, nil, nil)
highlight("TablineSel", grey, black, bold, nil)
highlight("StatusLineNC", grey, black, bold, nil)
highlight("StatusLine", white, black, bold, nil)
highlight("SignColumn", blue, black, nil, nil)
highlight("ColorColumn", black, dark_yellow, nil, nil)
highlight("Directory", blue, nil, bold, nil)
highlight("Conceal", grey, black, nil, nil)
highlight("CursorLine", white, grey, nil, nil)
highlight("WinBar", nil, black, nil, nil)
highlight("WinBarNC", nil, black, nil, nil)
highlight("QuickFixLine", cyan, nil, nil, nil)
highlight("MsgArea", nil, black, nil, nil)

-- floating windows
highlight("NormalFloat", white, black, nil, nil)
highlight("FloatShadow", nil, dark_grey, nil, nil)
highlight("FloatShadowThrough", nil, dark_grey, nil, nil)

-- spelling
highlight("SpellBad", red, black, underline, red)
highlight("SpellCap", cyan, black, underline, cyan)
highlight("SpellRare", green, black, underline, green)
highlight("SpellLocal", magenta, black, underline, magenta)

-- messages
highlight("Question", green, black, nil, nil)
highlight("Error", black, red, nil, nil)
highlight("ErrorMsg", red, black, underline, nil)
highlight("WarningMsg", yellow, black, underline, nil)
highlight("Todo", black, dark_yellow, bold, nil)
highlight("MoreMsg", green, black, bold, nil)
highlight("ModeMsg", green, black, bold, nil)
highlight("NvimInternalError", black, dark_red, nil, nil)

-- lsp
highlight("DiagnosticError", dark_red, black, nil, nil)
highlight("DiagnosticWarn", dark_yellow, black, nil, nil)
highlight("DiagnosticInfo", dark_blue, black, nil, nil)
highlight("DiagnosticHint", grey, black, nil, nil)
highlight("DiagnosticOk", dark_green, black, nil, nil)
highlight("DiagnosticUnderlineError", nil, nil, underline, dark_red)
highlight("DiagnosticUnderlineWarn", nil, nil, underline, dark_yellow)
highlight("DiagnosticUnderlineInfo", nil, nil, underline, dark_blue)
highlight("DiagnosticUnderlineHint", nil, nil, underline, grey)

-- completion
highlight("CmpItemAbbrMatch", dark_blue, "NONE", nil, nil)
highlight("CmpItemAbbrMatchFuzzy", blue, "NONE", nil, nil)
highlight("CmpItemKindVariable", green, "NONE", nil, nil)
highlight("CmpItemKindInterface", dark_cyan, "NONE", nil, nil)
highlight("CmpItemKindText", cyan, "NONE", nil, nil)
highlight("CmpItemKindFunction", magenta, "NONE", nil, nil)
highlight("CmpItemKindMethod", magenta, "NONE", nil, nil)
highlight("CmpItemKindKeyword", dark_yellow, "NONE", nil, nil)
highlight("CmpItemKindProperty", dark_yellow, "NONE", nil, nil)
highlight("CmpItemKindUnit", dark_yellow, "NONE", nil, nil)

-- indent lines
highlight("IndentBlanklineChar", dark_grey, nil, "NONE", nil)
highlight("IndentBlanklineSpaceChar", dark_grey, nil, "NONE", nil)
highlight("IndentBlanklineSpaceCharBlankline", dark_grey, nil, "NONE", nil)

-- syntax highlighting
highlight("Comment", grey, black, italic, nil)

highlight("Constant", white, black, "bold,italic", nil)
highlight("String", white, black, italic, nil)
highlight("Number", white, black, bold, nil)
highlight("Float", white, black, bold, nil)
highlight("Character", white, black, bold, nil)
highlight("Boolean", magenta, black, bold, nil)
highlight("Function", dark_blue, black, bold, nil)
highlight("Identifier", blue, black, nil, nil)

highlight("@character.special", white, black, bold, nil)
highlight("@variable", blue, black, nil, nil)
highlight("@variable.builtin", blue, black, nil, nil)
highlight("@module", blue, black, bold, nil)
highlight("@module.builtin", blue, black, bold, nil)
highlight("@type.builtin", blue, black, bold, nil)
highlight("@function.macro", dark_yellow, black, bold, nil)

highlight("Conditional", dark_green, black, "italic,bold", nil)
highlight("Repeat", dark_green, black, "italic,bold", nil)

highlight("Label", dark_green, black, nil, nil)
highlight("Statement", dark_green, black, nil, nil)
highlight("Operator", dark_green, black, bold, nil)
highlight("Keyword", dark_green, black, bold, nil)

highlight("PreProc", yellow, black, bold, nil)
highlight("Include", yellow, black, bold, nil)
highlight("Define", yellow, black, bold, nil)
highlight("Macro", dark_yellow, black, bold, nil)
highlight("PreCondit", yellow, black, bold, nil)

highlight("Type", blue, black, bold, nil)
highlight("Structure", blue, black, bold, nil)
highlight("StorageClass", green, black, bold, nil)
highlight("TypeDef", green, black, bold, nil)

highlight("Special", dark_yellow, black, bold, nil)
highlight("SpecialChar", dark_yellow, black, nil, nil)
highlight("Delimiter", dark_yellow, black, nil, nil)
highlight("SpecialComment", yellow, black, italic, nil)
highlight("Debug", dark_yellow, black, nil, nil)

-- diff
highlight("Added", black, green, nil, nil)
highlight("Removed", black, red, nil, nil)
highlight("Changed", black, magenta, nil, nil)
highlight("DiffAdd", black, green, nil, nil)
highlight("DiffText", black, cyan, nil, nil)
highlight("DiffDelete", black, red, nil, nil)
highlight("DiffChange", black, magenta, nil, nil)

-- redraw
highlight("RedrawDebugNormal", black, white, nil, nil)
highlight("RedrawDebugClear", black, dark_yellow, nil, nil)
highlight("RedrawDebugComposed", black, green, nil, nil)
highlight("RedrawDebugRecompose", black, red, nil, nil)

-- lazy.nvim
highlight("LazyButton", white, black, nil, nil)
highlight("LazyButtonActive", white, black, bold, nil)
highlight("LazyH1", white, black, bold, nil)

-- completion
highlight("CmpItemAbbrDefault", white, black, nil, nil)
highlight("CmpItemMenuDefault", white, black, nil, nil)
highlight("CmpItemAbbrDeprecatedDefault", white, black, nil, nil)
highlight("CmpItemAbbrMatchDefault", dark_blue, black, nil, nil)
highlight("CmpItemAbbrMatchFuzzyDefault", blue, black, nil, nil)
highlight("CmpItemKindDefault", cyan, black, nil, nil)

-- lualine
highlight("lualine_a_visual", black, yellow, nil, nil)
highlight("lualine_b_visual", yellow, black, nil, nil)
highlight("lualine_c_visual", grey, black, nil, nil)
highlight("lualine_a_replace", black, magenta, nil, nil)
highlight("lualine_b_replace", magenta, black, nil, nil)
highlight("lualine_c_replace", grey, black, nil, nil)
highlight("lualine_a_normal", white, black, nil, nil)
highlight("lualine_b_normal", white, black, nil, nil)
highlight("lualine_c_normal", white, black, nil, nil)
highlight("lualine_a_command", black, blue, nil, nil)
highlight("lualine_b_command", blue, black, nil, nil)
highlight("lualine_c_command", grey, black, nil, nil)
highlight("lualine_a_insert", black, green, nil, nil)
highlight("lualine_b_insert", green, black, nil, nil)
highlight("lualine_c_insert", grey, black, nil, nil)
highlight("lualine_a_terminal", black, cyan, nil, nil)
highlight("lualine_b_terminal", cyan, black, nil, nil)
highlight("lualine_c_terminal", grey, black, nil, nil)
highlight("lualine_a_inactive", grey, black, nil, nil)
highlight("lualine_b_inactive", grey, black, nil, nil)
highlight("lualine_c_inactive", grey, black, nil, nil)

highlight("lualine_y_diagnostics_error_normal", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_normal", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_normal", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_normal", grey, black, nil, nil)
highlight("lualine_c_diff_added_normal", green, black, nil, nil)
highlight("lualine_c_diff_modified_normal", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_normal", blue, black, nil, nil)

highlight("lualine_y_diagnostics_error_insert", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_insert", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_insert", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_insert", grey, black, nil, nil)
highlight("lualine_c_diff_added_insert", green, black, nil, nil)
highlight("lualine_c_diff_modified_insert", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_insert", blue, black, nil, nil)

highlight("lualine_y_diagnostics_error_visual", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_visual", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_visual", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_visual", grey, black, nil, nil)
highlight("lualine_c_diff_added_visual", green, black, nil, nil)
highlight("lualine_c_diff_modified_visual", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_visual", blue, black, nil, nil)

highlight("lualine_y_diagnostics_error_replace", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_replace", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_replace", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_replace", grey, black, nil, nil)
highlight("lualine_c_diff_added_replace", green, black, nil, nil)
highlight("lualine_c_diff_modified_replace", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_replace", blue, black, nil, nil)

highlight("lualine_y_diagnostics_error_command", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_command", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_command", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_command", grey, black, nil, nil)
highlight("lualine_c_diff_added_command", green, black, nil, nil)
highlight("lualine_c_diff_modified_command", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_command", blue, black, nil, nil)

highlight("lualine_y_diagnostics_error_terminal", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_terminal", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_terminal", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_terminal", grey, black, nil, nil)
highlight("lualine_c_diff_added_terminal", green, black, nil, nil)
highlight("lualine_c_diff_modified_terminal", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_terminal", blue, black, nil, nil)

highlight("lualine_y_diagnostics_error_inactive", red, black, nil, nil)
highlight("lualine_y_diagnostics_warn_inactive", dark_yellow, black, nil, nil)
highlight("lualine_y_diagnostics_info_inactive", blue, black, nil, nil)
highlight("lualine_y_diagnostics_hint_inactive", grey, black, nil, nil)
highlight("lualine_c_diff_added_inactive", green, black, nil, nil)
highlight("lualine_c_diff_modified_inactive", yellow, black, nil, nil)
highlight("lualine_c_diff_removed_inactive", blue, black, nil, nil)
