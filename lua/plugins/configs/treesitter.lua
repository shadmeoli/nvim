local options = {
  ensure_installed = { "lua" },
  ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername.mdx == "markdown",
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
