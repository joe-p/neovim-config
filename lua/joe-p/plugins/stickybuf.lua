return {
  {
    'stevearc/stickybuf.nvim',
    lazy = false,
    config = true,
    keys = {
      { '<leader>bs', desc = '[S]tick buffer' },
      { '<leader>bsb', '<cmd>PinBuffer<cr>', desc = 'Stick [B]uffer]' },
      { '<leader>bst', '<cmd>PinBuftype<cr>', desc = 'Stick Buf [T]ype' },
      { '<leader>bsf', '<cmd>PinFiletype<cr>', desc = 'Stick [F]ile Type' },
      { '<leader>bsu', '<cmd>Unpin<cr>', desc = '[U]nstick window' },
    },
  },
}
