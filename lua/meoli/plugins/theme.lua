return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Palette & style
      vim.g.gruvbox_material_background = 'hard' -- "hard" | "medium" | "soft"
      vim.g.gruvbox_material_foreground = 'original' -- "original" | "mix" | "material"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_transparent_background = 1 -- set 0 if you want a solid bg
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_float_style = 'dim'
      vim.g.gruvbox_material_visual = 'grey background'
      vim.g.gruvbox_material_menu_selection_background = 'aqua'

      -- Osaka accent overrides (applied after colorscheme loads)
      local function apply_osaka_highlights()
        -- Floats / borders — teal osaka accent
        vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#7daea3', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1d2021' })

        -- Cursor line
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#282828' })
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#d8a657', bold = true })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#504945' })

        -- Comments — muted, italic
        vim.api.nvim_set_hl(0, 'Comment', { fg = '#665c54', italic = true })

        -- Telescope
        vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#7daea3' })
        vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1d2021' })

        -- NvimTree sidebar
        vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = '#1c1c1c' })
        vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = '#1c1c1c' })

        -- Indent guides
        vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#3c3836' })
        vim.api.nvim_set_hl(0, 'IblScope', { fg = '#7daea3' })
      end

      vim.cmd.colorscheme 'gruvbox-material'
      apply_osaka_highlights()

      -- Re-apply after any colorscheme reload
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'gruvbox-material',
        callback = apply_osaka_highlights,
      })
    end,
  },
}

-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   priority = 1000,
--   config = function()
--     require('rose-pine').setup {
--       disable_background = true,
--     }
--
--     function ColorMyPencils(color)
--       color = color or 'rose-pine'
--       vim.cmd.colorscheme(color)
--
--       vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--     end
--
--     ColorMyPencils()
--   end,
-- }
--
