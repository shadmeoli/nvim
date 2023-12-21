vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true
vim.wo.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require("shad.plugins.init")

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript"},
  highlight = { enable = true },
  indent = { enable = true },  
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Nerd tree configuration and Keymaps
-- Key mappings for NERDTree
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true })


vim.cmd[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.md,*.html,*.yaml,*.yml,*.lua silent! !prettier --write <afile>
  augroup END
]]

vim.cmd[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.go lua vim.lsp.buf.formatting()
  augroup END
]]

vim.cmd[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.py,*.pyi,*.pyw,*.c,*.h,*.cpp,*.go,*.yaml,*.yml lua vim.lsp.buf.formatting()
  augroup END
]]

-- mason setup
require("mason").setup()
require("mason-lspconfig").setup()
