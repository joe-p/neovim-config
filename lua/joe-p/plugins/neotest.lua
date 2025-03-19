return {
  'nvim-neotest/neotest',
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-golang' { runner = 'gotestsum' },
      },
    }
  end,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'fredrikaverpil/neotest-golang',
  },
  keys = {
    {
      '<leader>tt',
      function()
        require('neotest').run.run()
        require('neotest').summary.open()
      end,
      desc = 'Run Test',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open()
      end,
      desc = 'Open Output',
    },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
        require('neotest').summary.open()
      end,
      desc = 'Run File',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle Summary',
    },
    {
      '<leader>tq',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop',
    },
    {
      '<leader>ta',
      function()
        require('neotest').run.attach()
      end,
      desc = 'Attach',
    },
  },
}
