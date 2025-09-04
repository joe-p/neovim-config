return {
  'piersolenski/wtf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    provider = 'copilot',
    popup_type = 'horizontal',
  },
  keys = {
    {
      '<leader>cd',
      mode = { 'n', 'x' },
      function()
        require('wtf').diagnose()
      end,
      desc = 'Debug diagnostic with AI',
    },
    {
      '<leader>cf',
      mode = { 'n', 'x' },
      function()
        require('wtf').fix()
      end,
      desc = 'Fix diagnostic with AI',
    },
  },
}
