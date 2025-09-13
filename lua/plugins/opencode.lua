return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
    { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
  },
  ---@type opencode.Opts
  opts = {
    terminal = {
      win = {
        enter = true,
        position = 'float',
      },
    },
  },
  keys = {
    {
      '<leader>aa',
      function()
        require('opencode').ask '@cursor: '
      end,
      desc = 'Ask opencode about this',
      mode = 'n',
    },
    {
      '<leader>aa',
      function()
        require('opencode').ask '@selection: '
      end,
      desc = 'Ask opencode about selection',
      mode = 'v',
    },
    {
      '<leader>ac',
      function()
        require('opencode').toggle()
      end,
      desc = 'Toggle embedded opencode',
    },
    {
      '<leader>an',
      function()
        require('opencode').command 'session_new'
      end,
      desc = 'New session',
    },
    -- Example: keymap for custom prompt
    {
      '<leader>ad',
      function()
        require('opencode').ask 'Explain @diagnostic and how to fix it'
      end,
      desc = 'Explain code near cursor',
    },
  },
}
