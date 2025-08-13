return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 2000,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      go = { 'goimports' },
      javascript = { 'biome' },
      javascriptreact = { 'biome' },
      typescript = { 'biome' },
      typescriptreact = { 'biome' },
      json = { 'biome' },
      jsonc = { 'biome' },
    },
    formatters = {
      biome = {
        timeout_ms = 3000,
      },
    },
  },
}
