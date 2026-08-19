return {
  dir = vim.fn.stdpath 'config',
  name = 'monokai-og-local',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'monokai-og'
  end,
}
