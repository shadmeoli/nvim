vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Window navigation will be handled by vim-tmux-navigator plugin
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window splitting keymaps
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split [W]indow [V]ertically' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split [W]indow horizontally [S]' })
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = '[W]indow [C]lose' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = '[W]indow [O]nly (close others)' })

-- Simple comment toggle with leader + /
vim.keymap.set('n', '<leader>/', function()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local comment_string = vim.bo.commentstring:gsub('%%s', '')

  if line:match('^%s*' .. vim.pesc(comment_string)) then
    -- Uncomment: remove comment string and any following space
    local new_line = line:gsub('^(%s*)' .. vim.pesc(comment_string) .. '%s?', '%1')
    vim.api.nvim_set_current_line(new_line)
  else
    -- Comment: add comment string after leading whitespace
    local indent = line:match '^%s*'
    local content = line:sub(#indent + 1)
    local new_line = indent .. comment_string .. ' ' .. content
    vim.api.nvim_set_current_line(new_line)
    -- Adjust cursor position
    cursor_pos[2] = cursor_pos[2] + #comment_string + 1
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end
end, { desc = 'Toggle comment on current line' })

-- Visual mode comment toggle
vim.keymap.set('v', '<leader>/', function()
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  local comment_string = vim.bo.commentstring:gsub('%%s', '')

  for line_num = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
    local new_line

    if line:match('^%s*' .. vim.pesc(comment_string)) then
      -- Uncomment
      new_line = line:gsub('^(%s*)' .. vim.pesc(comment_string) .. '%s?', '%1')
    else
      -- Comment
      local indent = line:match '^%s*'
      local content = line:sub(#indent + 1)
      new_line = indent .. comment_string .. ' ' .. content
    end

    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
  end
end, { desc = 'Toggle comment on selected lines' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Set indent to 2 spaces for JavaScript/TypeScript files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'json', 'jsonc', 'go', 'rust', 'zig', 'lua', 'html', 'tmpl' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>w', group = '[W]indow' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  { import = 'meoli.plugins' },
}, {

  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local api = require 'Comment.api'

vim.keymap.set('n', '//', function()
  api.toggle.linewise.current()
end, { desc = 'Toggle comment' })

vim.keymap.set('v', '//', function()
  api.toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment (visual)' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
