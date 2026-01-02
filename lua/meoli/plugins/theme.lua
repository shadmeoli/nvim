-- return {
--   {
--     'Mofiqul/vscode.nvim',
--     priority = 1000,
--     config = function()
--       require('vscode').setup {
--         style = 'dark',
--         transparent = false,
--         italic_comments = true,
--         disable_nvimtree_bg = true,
--       }
--
--       require('vscode').load()
--     end,
--   },
-- }
--

return {
  {
    'craftzdog/solarized-osaka.nvim',
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require('solarized-osaka').setup(opts)
      vim.cmd.colorscheme 'solarized-osaka'

      local palette = require('solarized-osaka.colors').setup()
      vim.api.nvim_set_hl(0, 'Normal', {
        fg = palette.fg,
        bg = palette.bg,
      })
      vim.api.nvim_set_hl(0, 'NormalNC', {
        fg = palette.fg,
        bg = palette.bg,
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
--       variant = 'auto', -- auto, main, moon, or dawn
--       dark_variant = 'main', -- main, moon, or dawn
--       dim_inactive_windows = false,
--       extend_background_behind_borders = true,
--
--       enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--       },
--
--       styles = {
--         bold = true,
--         italic = true,
--         transparency = false,
--       },
--
--       groups = {
--         border = 'muted',
--         link = 'iris',
--         panel = 'surface',
--
--         error = 'love',
--         hint = 'iris',
--         info = 'foam',
--         note = 'pine',
--         todo = 'rose',
--         warn = 'gold',
--
--         git_add = 'foam',
--         git_change = 'rose',
--         git_delete = 'love',
--         git_dirty = 'rose',
--         git_ignore = 'muted',
--         git_merge = 'iris',
--         git_rename = 'pine',
--         git_stage = 'iris',
--         git_text = 'rose',
--         git_untracked = 'subtle',
--
--         h1 = 'iris',
--         h2 = 'foam',
--         h3 = 'rose',
--         h4 = 'gold',
--         h5 = 'pine',
--         h6 = 'foam',
--       },
--
--       palette = {
--         -- Override the builtin palette per variant
--         moon = {
--           base = '#18191a',
--           overlay = '#363738',
--         },
--       },
--
--       highlight_groups = {
--         Comment = { fg = 'foam' },
--         VertSplit = { fg = 'muted', bg = 'muted' },
--       },
--
--       before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         if highlight.undercurl then
--           highlight.undercurl = false
--         end
--
--         -- Change palette colour
--         if highlight.fg == palette.pine then
--           highlight.fg = palette.foam
--         end
--       end,
--     }
--
--     -- Set the colorscheme
--     vim.cmd 'colorscheme rose-pine'
--
--     -- Optional: Set specific variant
--     -- vim.cmd('colorscheme rose-pine-main')
--     -- vim.cmd('colorscheme rose-pine-moon')
--     -- vim.cmd('colorscheme rose-pine-dawn')
--   end,
-- }
