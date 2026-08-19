vim.cmd.highlight 'clear'

if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd.syntax 'reset'
end

vim.g.colors_name = 'monokai-og'
vim.o.termguicolors = true

local palette = {
  bg = '#272822',
  bg_alt = '#1e1f1c',
  bg_float = '#2d2e27',
  bg_highlight = '#3e3d32',
  fg = '#f8f8f2',
  fg_dim = '#cfcfc2',
  comment = '#75715e',
  red = '#f92672',
  orange = '#fd971f',
  yellow = '#e6db74',
  green = '#a6e22e',
  cyan = '#a1efe4',
  blue = '#66d9ef',
  purple = '#ae81ff',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl('Normal', { fg = palette.fg, bg = palette.bg })
hl('NormalNC', { fg = palette.fg_dim, bg = palette.bg })
hl('NormalFloat', { fg = palette.fg, bg = palette.bg_float })
hl('FloatBorder', { fg = palette.comment, bg = palette.bg_float })
hl('Pmenu', { fg = palette.fg, bg = palette.bg_float })
hl('PmenuSel', { fg = palette.bg, bg = palette.blue, bold = true })
hl('PmenuSbar', { bg = palette.bg_highlight })
hl('PmenuThumb', { bg = palette.comment })
hl('Cursor', { fg = palette.bg, bg = palette.fg })
hl('CursorLine', { bg = palette.bg_highlight })
hl('CursorLineNr', { fg = palette.yellow, bg = palette.bg_highlight, bold = true })
hl('LineNr', { fg = palette.comment })
hl('SignColumn', { fg = palette.comment, bg = palette.bg })
hl('ColorColumn', { bg = palette.bg_highlight })
hl('Visual', { bg = palette.bg_highlight })
hl('Search', { fg = palette.bg, bg = palette.yellow })
hl('IncSearch', { fg = palette.bg, bg = palette.orange })
hl('MatchParen', { fg = palette.yellow, bg = palette.bg_highlight, bold = true })
hl('NonText', { fg = palette.comment })
hl('EndOfBuffer', { fg = palette.bg })
hl('WinSeparator', { fg = palette.comment })
hl('StatusLine', { fg = palette.fg, bg = palette.bg_alt })
hl('StatusLineNC', { fg = palette.comment, bg = palette.bg_alt })
hl('TabLine', { fg = palette.comment, bg = palette.bg_alt })
hl('TabLineSel', { fg = palette.fg, bg = palette.bg })
hl('TabLineFill', { bg = palette.bg_alt })

hl('Comment', { fg = palette.comment, italic = true })
hl('Constant', { fg = palette.purple })
hl('String', { fg = palette.yellow })
hl('Character', { fg = palette.yellow })
hl('Number', { fg = palette.purple })
hl('Boolean', { fg = palette.purple })
hl('Float', { fg = palette.purple })
hl('Identifier', { fg = palette.fg })
hl('Function', { fg = palette.green })
hl('Statement', { fg = palette.red })
hl('Conditional', { fg = palette.red })
hl('Repeat', { fg = palette.red })
hl('Label', { fg = palette.red })
hl('Operator', { fg = palette.red })
hl('Keyword', { fg = palette.red, italic = true })
hl('Exception', { fg = palette.red })
hl('PreProc', { fg = palette.blue })
hl('Include', { fg = palette.red })
hl('Define', { fg = palette.red })
hl('Macro', { fg = palette.red })
hl('Type', { fg = palette.blue })
hl('StorageClass', { fg = palette.blue, italic = true })
hl('Structure', { fg = palette.blue })
hl('Typedef', { fg = palette.blue })
hl('Special', { fg = palette.cyan })
hl('SpecialChar', { fg = palette.cyan })
hl('Tag', { fg = palette.red })
hl('Delimiter', { fg = palette.fg })
hl('Debug', { fg = palette.orange })
hl('Underlined', { fg = palette.blue, underline = true })
hl('Error', { fg = palette.red, bg = palette.bg })
hl('Todo', { fg = palette.bg, bg = palette.yellow, bold = true })

hl('DiagnosticError', { fg = palette.red })
hl('DiagnosticWarn', { fg = palette.orange })
hl('DiagnosticInfo', { fg = palette.blue })
hl('DiagnosticHint', { fg = palette.cyan })
hl('DiagnosticUnderlineError', { sp = palette.red, undercurl = true })
hl('DiagnosticUnderlineWarn', { sp = palette.orange, undercurl = true })
hl('DiagnosticUnderlineInfo', { sp = palette.blue, undercurl = true })
hl('DiagnosticUnderlineHint', { sp = palette.cyan, undercurl = true })

hl('DiffAdd', { fg = palette.green, bg = '#31411f' })
hl('DiffChange', { fg = palette.yellow, bg = '#403d24' })
hl('DiffDelete', { fg = palette.red, bg = '#45212f' })
hl('DiffText', { fg = palette.blue, bg = '#2f4450', bold = true })
hl('GitSignsAdd', { fg = palette.green })
hl('GitSignsChange', { fg = palette.yellow })
hl('GitSignsDelete', { fg = palette.red })

hl('@variable', { fg = palette.fg })
hl('@variable.builtin', { fg = palette.purple, italic = true })
hl('@constant', { fg = palette.purple })
hl('@constant.builtin', { fg = palette.purple })
hl('@string', { fg = palette.yellow })
hl('@number', { fg = palette.purple })
hl('@boolean', { fg = palette.purple })
hl('@function', { fg = palette.green })
hl('@function.builtin', { fg = palette.green })
hl('@constructor', { fg = palette.blue })
hl('@keyword', { fg = palette.red, italic = true })
hl('@keyword.function', { fg = palette.red, italic = true })
hl('@operator', { fg = palette.red })
hl('@type', { fg = palette.blue })
hl('@property', { fg = palette.cyan })
hl('@field', { fg = palette.cyan })
hl('@punctuation', { fg = palette.fg })
hl('@tag', { fg = palette.red })
hl('@tag.attribute', { fg = palette.green })
hl('@tag.delimiter', { fg = palette.fg })

hl('TelescopeNormal', { fg = palette.fg, bg = palette.bg_float })
hl('TelescopeBorder', { fg = palette.comment, bg = palette.bg_float })
hl('TelescopeSelection', { fg = palette.fg, bg = palette.bg_highlight })
hl('TelescopeMatching', { fg = palette.yellow, bold = true })
hl('NeoTreeNormal', { fg = palette.fg, bg = palette.bg_alt })
hl('NeoTreeNormalNC', { fg = palette.fg_dim, bg = palette.bg_alt })
hl('NeoTreeEndOfBuffer', { fg = palette.bg_alt, bg = palette.bg_alt })
hl('IblIndent', { fg = palette.bg_highlight })
hl('IblScope', { fg = palette.comment })
