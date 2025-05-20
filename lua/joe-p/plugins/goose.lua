return {
  'azorng/goose.nvim',
  config = function()
    require('goose').setup {
      default_global_keymaps = false,
    }
  end,
  keys = {
    {
      '<leader>ac',
      function()
        require('goose.api').toggle()
      end,
    },
    {
      '<leader>gn',
      function()
        require('goose.api').open_input_new_session()
      end,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        anti_conceal = { enabled = false },
      },
    },
  },
}
