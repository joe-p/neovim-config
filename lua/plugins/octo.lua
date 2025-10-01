return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup {
      enable_builtin = true, -- shows a list of builtin actions when no action is provided
      picker = 'snacks',
    }
  end,
  keys = {
    { '<leader>go', '<cmd>Octo<cr>', desc = 'Open Octo' },
  },
}
