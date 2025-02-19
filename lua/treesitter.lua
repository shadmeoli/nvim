
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "python",
    "typescript",
    "javascript",
    "go",
    "markdown",
    "bash",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
