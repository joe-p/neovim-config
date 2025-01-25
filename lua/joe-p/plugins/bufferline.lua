return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    keys = {
      { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = 'Toggle [B]uffer [P]in' },
      -- BufferLinePick
      { '<leader> ', '<cmd>BufferLinePick<CR>', desc = 'Pick Buffer' },
      -- BufferLinePickClose
      { '<leader>bC', '<cmd>BufferLinePickClose<CR>', desc = 'Pick Buffer and [C]lose' },
    },
  },
}
