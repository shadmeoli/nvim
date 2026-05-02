-- dev container setup to be able to open dev containers
return {
  'esensar/nvim-dev-container',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('devcontainer').setup {
      -- By default all mounts are added (config, data and state)
      -- This can be changed to disable mounts or change their options
      -- This can be useful to mount local configuration
      -- And any other mounts when attaching to containers with this plugin
      attach_mounts = {
        neovim_config = {
          -- enables mounting local config to /root/.config/nvim in container
          enabled = false,
          -- makes mount readonly in container
          options = { 'readonly' },
        },
        neovim_data = {
          -- enables mounting local data to /root/.local/share/nvim in container
          enabled = false,
          -- no options by default
          options = {},
        },
        -- Only useful if using neovim 0.8.0+
        neovim_state = {
          -- enables mounting local state to /root/.local/state/nvim in container
          enabled = false,
          -- no options by default
          options = {},
        },
      },
    }
  end,
}
