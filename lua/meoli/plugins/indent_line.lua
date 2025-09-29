return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
      buftypes = { 'terminal', 'nofile' },
    },
  },
  config = function(_, opts)
    require('ibl').setup(opts)
    vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#3a3a3a', nocombine = true })
  end,
}
