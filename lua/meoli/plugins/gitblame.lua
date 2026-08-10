return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  cmd = {
    'GitBlameToggle',
    'GitBlameEnable',
    'GitBlameDisable',
    'GitBlameOpenCommitURL',
    'GitBlameCopySHA',
    'GitBlameCopyCommitURL',
    'GitBlameOpenFileURL',
    'GitBlameCopyFileURL',
  },
  keys = {
    { '<leader>gB', '<cmd>GitBlameToggle<CR>', desc = 'Toggle git blame' },
    { '<leader>go', '<cmd>GitBlameOpenCommitURL<CR>', desc = 'Open git blame commit URL' },
    { '<leader>gy', '<cmd>GitBlameCopySHA<CR>', desc = 'Copy git blame SHA' },
  },
  opts = {
    enabled = true,
    message_template = ' <summary> - <date> - <author> - <<sha>>',
    date_format = '%r',
    delay = 500,
    virtual_text_column = 80,
    set_extmark_options = {
      priority = 7,
    },
  },
}
