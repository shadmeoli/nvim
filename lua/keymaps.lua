local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Key
vim.g.mapleader = " "

-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<Leader>bd", ":bd<CR>", opts)

-- File Explorer (nvim-tree)
map("n", "<Leader>w", ":NvimTreeToggle<CR>", opts)
map("n", "<Leader>e", ":NvimTreeFocus<CR>", opts)

