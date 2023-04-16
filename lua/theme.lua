vim.cmd([[

let backg = "#151515"
let foreg = "#d7d0c7"
let black = "#101010"
let grey = "#404040"
let red = "#e84f4f"
let redb = "#d23d3d"
let green = "#b8d68c"
let greenb = "#a0cf5d"
let yellow = "#e1aa5d"
let yellowb = "#f39d21"
let blue = "#7dc1cf"
let blueb = "#4e9fb1"
let magenta = "#9b64fb"
let magentab = "#8542ff"
let cyan = "#20a494"
let cyanb = "#21d6c7"
let white = "#909090"
let whiteb = "#dddddd"

execute "highlight Normal guibg=" . backg
execute "highlight Normal guifg=" . foreg
execute "highlight comment guifg=" . white
execute "highlight LineNr guifg=" . yellow  
execute "highlight CursorLineNr guifg=" . red
execute "highlight MatchParen guibg=" . grey
execute "highlight Constant guifg=" . magenta
execute "highlight Identifier guifg=" . blue
execute "highlight Statement guifg=" . greenb
execute "highlight Type guifg=" . blueb
execute "highlight PreProc guifg=" . yellowb
execute "highlight Title guifg=" . greenb
execute "highlight Question guifg=" . green
execute "highlight WildMenu guibg=" . yellow
execute "highlight WildMenu guibg=" . backg
execute "highlight SpecialKey guifg=" . cyan
execute "highlight NonText guifg=" . cyan
execute "highlight Directory guifg=" . blueb
execute "highlight ToolBarLine guibg=" . grey
execute "highlight ToolBarLine guifg=" . foreg
execute "highlight Error guibg=" . redb
execute "highlight Error guifg=" . foreg
execute "highlight Todo guibg=" . yellow
execute "highlight Todo guifg=" . backg
execute "highlight ErrorMsg guibg=" . redb
execute "highlight ErrorMsg guifg=" . foreg
execute "highlight Search guibg=" . green
execute "highlight Search guifg=" . backg
execute "highlight WarningMsg guifg=" . redb
execute "highlight Visual guibg=" . grey 
execute "highlight Visual guifg=" . foreg
execute "highlight DiffAdd guibg=" . greenb
execute "highlight DiffAdd guifg=" . backg
execute "highlight DiffText guibg=" . cyan 
execute "highlight DiffText guifg=" . foreg 
execute "highlight DiffDelete guibg=" . grey
execute "highlight DiffDelete guifg=" . redb 
execute "highlight DiffChange guibg=" . magenta 
execute "highlight DiffChange guifg=" . foreg 
execute "highlight Folded guibg=" . grey 
execute "highlight Folded guifg=" . blueb 
execute "highlight FoldColumn guibg=" . grey
execute "highlight FoldColumn guifg=" . blueb 
execute "highlight Pmenu guifg=" . foreg 
execute "highlight Pmenu guibg=" . grey
execute "highlight PmenuSel guibg=" . grey
execute "highlight PmenuSel guifg=" . green
execute "highlight VertSplit guibg=" . backg
execute "highlight VertSplit guifg=" . grey
execute "highlight StatusLineNC guibg=" . backg
execute "highlight StatuslineNC guifg=" . grey
execute "highlight StatusLine guibg=" . foreg
execute "highlight Statusline guifg=" . grey
execute "highlight NvimInternalError guifg=" . backg
execute "highlight TabLine guifg=" . backg
execute "highlight TabLine guibg=" . grey
execute "highlight TabLineFill guibg=" . backg
execute "highlight TabLineFill guifg=" . grey
execute "highlight TabLineSel gui= bold guifg=" . foreg
execute "highlight TabLineSel guibg=" . grey 

execute "highlight SignColumn guibg=" . grey
execute "highlight DiagnosticError guifg=" . redb
execute "highlight DiagnosticWarn guifg=" . yellowb
execute "highlight DiagnosticInfo guifg=" . blue
execute "highlight DiagnosticHint guifg=" . grey

execute "highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=" . grey
execute "highlight! CmpItemAbbrMatch guibg=NONE guifg=" . blue
execute "highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=" . blue
execute "highlight! CmpItemKindVariable guibg=NONE guifg=" . cyan
execute "highlight! CmpItemKindInterface guibg=NONE guifg=" . cyan
execute "highlight! CmpItemKindText guibg=NONE guifg=" . cyan
execute "highlight! CmpItemKindFunction guibg=NONE guifg=" . magenta
execute "highlight! CmpItemKindMethod guibg=NONE guifg=" . magenta
execute "highlight! CmpItemKindKeyword guibg=NONE guifg=" . foreg
execute "highlight! CmpItemKindProperty guibg=NONE guifg=" . foreg
execute "highlight! CmpItemKindUnit guibg=NONE guifg=" . foreg


execute "highlight IndentBlanklineChar guifg=" . grey
execute "highlight IndentBlanklineSpaceChar guifg=" . grey
execute "highlight IndentBlanklineSpaceCharBlankline guifg=" . grey
execute "highlight IndentBlanklineChar guifg=" . grey
]])
