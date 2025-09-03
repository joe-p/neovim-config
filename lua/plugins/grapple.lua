return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git_branch',
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>p', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
    { '<leader> ', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
  },
}
