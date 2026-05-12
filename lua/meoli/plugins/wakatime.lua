return {
  'wakatime/vim-wakatime',
  lazy = false,
  keys = {
    { '<leader>ct', '<cmd>WakaTimeToday<CR>', desc = '[C]ode time [T]oday' },
    { '<leader>cd', '<cmd>WakaTimeDebugEnable<CR>', desc = '[C]ode time [D]ebug enable' },
    { '<leader>cD', '<cmd>WakaTimeDebugDisable<CR>', desc = '[C]ode time [D]ebug disable' },
    { '<leader>cl', '<cmd>WakaTimeLog<CR>', desc = '[C]ode time [L]og' },
  },
  config = function()
    local ok, which_key = pcall(require, 'which-key')
    if ok then
      which_key.add {
        { '<leader>c', group = '[C]ode stats' },
      }
    end

    vim.api.nvim_create_user_command('WakaTimeLog', function()
      local log_path = vim.fn.expand '~/.wakatime/wakatime.log'

      if vim.fn.filereadable(log_path) == 0 then
        vim.notify('No WakaTime log found at ' .. log_path, vim.log.levels.WARN)
        return
      end

      vim.cmd.edit(vim.fn.fnameescape(log_path))
    end, { desc = 'Open the WakaTime log file' })
  end,
}
