return {
  {
    'linrongbin16/gitlinker.nvim',
    cmd = 'GitLink',
    opts = {},
    keys = {
      { '<leader>gy', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = '[Y]ank git link' },
      { '<leader>go', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = '[O]pen git link' },
    },
  },
}
