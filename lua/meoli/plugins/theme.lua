-- return {}

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false,
      term_colors = true,
      no_italic = false,
      no_bold = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
      },
    }

    -- Load the colorscheme
    vim.cmd.colorscheme 'catppuccin'
  end,
}
-- return {
--   'felipeagc/fleet-theme-nvim',
--   config = function()
--     vim.cmd 'colorscheme fleet'
--
--     vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#3c3c3c', nocombine = true })
--   end,
-- }

-- return {
--   'olivercederborg/poimandres.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('poimandres').setup {
--       bold_vert_split = false, -- use bold vertical separators
--       dim_nc_background = false, -- dim 'non-current' window backgrounds
--       disable_background = false, -- disable background
--       disable_float_background = false, -- disable background for floats
--       disable_italics = true, -- disable italics
--     }
--   end,
--   init = function()
--     vim.cmd 'colorscheme poimandres'
--   end,
-- }

--return {
--  'folke/tokyonight.nvim',
--  priority = 1000, -- Make sure to load this before all the other start plugins.
--  init = function()
--    vim.cmd.colorscheme 'tokyonight-night'
--    vim.cmd.hi 'Comment gui=none'
--  end,
--}
--
--
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

--       enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--       },

--       styles = {
--         bold = true,
--         italic = true,
--         transparency = false,
--       },

--       groups = {
--         border = 'muted',
--         link = 'iris',
--         panel = 'surface',

--         error = 'love',
--         hint = 'iris',
--         info = 'foam',
--         note = 'pine',
--         todo = 'rose',
--         warn = 'gold',

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

--         h1 = 'iris',
--         h2 = 'foam',
--         h3 = 'rose',
--         h4 = 'gold',
--         h5 = 'pine',
--         h6 = 'foam',
--       },

--       palette = {
--         -- Override the builtin palette per variant
--         -- moon = {
--         --     base = '#18191a',
--         --     overlay = '#363738',
--         -- },
--       },

--       highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--       },

--       before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--       end,
--     }

--     -- Set the colorscheme
--     vim.cmd 'colorscheme rose-pine'

--     -- Optional: Set specific variant
--     -- vim.cmd('colorscheme rose-pine-main')
--     -- vim.cmd('colorscheme rose-pine-moon')
--     -- vim.cmd('colorscheme rose-pine-dawn')
--   end,
-- },
--
