-- Catppuccin Mocha. Solid base matches the tmux status bar (#1e1e2e).
-- Set `transparent_background = true` if the terminal background should show through.
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'mocha',
    background = {
      light = 'latte',
      dark = 'mocha',
    },
    transparent_background = false,
    term_colors = true,
    auto_integrations = true,
    integrations = {
      blink_cmp = { enabled = true, style = 'bordered' },
      dap = true,
      dap_ui = true,
      gitsigns = true,
      indent_blankline = { enabled = true },
      mason = true,
      mini = { enabled = true },
      neotree = true,
      telescope = { enabled = true },
      which_key = true,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}
