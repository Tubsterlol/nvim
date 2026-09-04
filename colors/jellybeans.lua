vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "jellybeans"

local colors = {
	bg = "#151515",
	surface = "#1c1c1c",
	border = "#403c41",
	text = "#e8e8d3",
	muted = "#888888",
	dim = "#605958",
	blue = "#8fbfdc",
	keyword = "#8197bf",
	green = "#99ad6a",
	olive = "#799d6a",
	yellow = "#fad07a",
	orange = "#ffb964",
	red = "#cf6a4c",
	purple = "#c6b6ee",
}

local function set(group, value)
	vim.api.nvim_set_hl(0, group, value)
end

set("Normal", { fg = colors.text, bg = colors.bg })
set("NormalFloat", { fg = colors.text, bg = colors.surface })
set("EndOfBuffer", { fg = colors.bg, bg = colors.bg })
set("SignColumn", { fg = colors.muted, bg = colors.bg })
set("CursorLine", { bg = colors.surface })
set("CursorLineNr", { fg = colors.text, bold = true })
set("LineNr", { fg = colors.dim })
set("ColorColumn", { bg = colors.surface })
set("Folded", { fg = colors.muted, bg = colors.surface })
set("FoldColumn", { fg = colors.muted, bg = colors.bg })
set("Visual", { bg = "#283b4d" })
set("Search", { fg = colors.bg, bg = colors.yellow })
set("IncSearch", { fg = colors.bg, bg = colors.orange })
set("CurSearch", { fg = colors.bg, bg = colors.orange })
set("MatchParen", { fg = colors.orange, bold = true, underline = true })
set("Directory", { fg = colors.blue })
set("Title", { fg = colors.yellow, bold = true })

set("StatusLine", { fg = colors.text, bg = colors.surface })
set("StatusLineNC", { fg = colors.muted, bg = colors.surface })
set("WinSeparator", { fg = colors.border, bg = colors.bg })
set("TabLine", { fg = colors.muted, bg = colors.surface })
set("TabLineFill", { fg = colors.dim, bg = colors.bg })
set("TabLineSel", { fg = colors.text, bg = colors.bg, bold = true })
set("Pmenu", { fg = colors.text, bg = colors.surface })
set("PmenuSel", { fg = colors.bg, bg = colors.blue, bold = true })
set("PmenuSbar", { bg = colors.border })
set("PmenuThumb", { bg = colors.muted })
set("FloatBorder", { fg = colors.blue, bg = colors.surface })
set("FloatTitle", { fg = colors.yellow, bg = colors.surface, bold = true })
set("Question", { fg = colors.green })
set("WarningMsg", { fg = colors.yellow })
set("ErrorMsg", { fg = colors.red })
set("NonText", { fg = colors.dim })
set("Whitespace", { fg = colors.dim })
set("SpecialKey", { fg = colors.dim })

set("Comment", { fg = colors.muted, italic = true })
set("Constant", { fg = colors.red })
set("String", { fg = colors.green })
set("Character", { fg = colors.green })
set("Number", { fg = colors.red })
set("Boolean", { fg = colors.red })
set("Float", { fg = colors.red })
set("Identifier", { fg = colors.text })
set("Function", { fg = colors.yellow })
set("Statement", { fg = colors.keyword })
set("Conditional", { fg = colors.keyword })
set("Repeat", { fg = colors.keyword })
set("Label", { fg = colors.blue })
set("Operator", { fg = colors.blue })
set("Keyword", { fg = colors.keyword })
set("Exception", { fg = colors.red })
set("PreProc", { fg = colors.text })
set("Include", { fg = colors.keyword })
set("Define", { fg = colors.keyword })
set("Macro", { fg = colors.keyword })
set("Type", { fg = colors.orange })
set("StorageClass", { fg = colors.orange })
set("Structure", { fg = colors.orange })
set("Typedef", { fg = colors.orange })
set("Special", { fg = colors.purple })
set("Delimiter", { fg = colors.text })
set("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })

set("@attribute", { fg = colors.blue })
set("@boolean", { fg = colors.red })
set("@comment", { fg = colors.muted, italic = true })
set("@constant", { fg = colors.red })
set("@constructor", { fg = colors.blue })
set("@function", { fg = colors.yellow })
set("@function.builtin", { fg = colors.red })
set("@keyword", { fg = colors.keyword })
set("@number", { fg = colors.red })
set("@operator", { fg = colors.blue })
set("@property", { fg = colors.text })
set("@string", { fg = colors.green })
set("@tag", { fg = colors.green })
set("@type", { fg = colors.orange })
set("@variable", { fg = colors.text })
set("@variable.builtin", { fg = colors.red })

set("DiagnosticError", { fg = colors.red })
set("DiagnosticWarn", { fg = colors.yellow })
set("DiagnosticInfo", { fg = colors.blue })
set("DiagnosticHint", { fg = colors.olive })
set("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.olive })

set("GitSignsAdd", { fg = colors.green })
set("GitSignsChange", { fg = colors.yellow })
set("GitSignsDelete", { fg = colors.red })
set("DiffAdd", { fg = colors.green, bg = "#322b11" })
set("DiffChange", { fg = colors.yellow, bg = "#572e10" })
set("DiffDelete", { fg = colors.red, bg = "#590a0f" })
set("DiffText", { fg = colors.orange, bg = "#754916" })

set("LspReferenceText", { bg = "#1f2a31" })
set("LspReferenceRead", { bg = "#1f2a31" })
set("LspReferenceWrite", { bg = "#4a463d" })
