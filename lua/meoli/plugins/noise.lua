return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    -- setup nvim-notify first
    require('notify').setup {
      background_colour = '#000000', -- fixes the warning
      stages = 'fade_in_slide_out',
      timeout = 2000, -- auto-dismiss after 2s
      render = 'default',
      max_width = 50,
      max_height = 5,
      top_down = false, -- top instead of bottom
    }
    vim.notify = require 'notify'

    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true, -- classic bottom search
        command_palette = true, -- cmdline + popupmenu together
        long_message_to_split = true, -- long errors go to split, not overlay
        inc_rename = false,
        lsp_doc_border = false,
      },
      notify = {
        enabled = true,
        view = 'notify',
      },
      views = {
        notify = {
          position = {
            row = 1, -- top
            col = -1, -- right
          },
          size = {
            width = 20,
            height = 5,
          },
          border = {
            style = 'rounded',
          },
        },
      },
      routes = {
        {
          filter = { event = 'notify', min_height = 10 },
          opts = { skip = true }, -- skip huge blocking notify windows
        },
      },
    }
  end,
}
