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
      '<leader>Tt',
      function()
        require('neotest').run.run()
        require('neotest').summary.open()
      end,
      desc = 'Run Test',
    },
    {
      '<leader>To',
      function()
        require('neotest').output.open()
      end,
      desc = 'Open Output',
    },
    {
      '<leader>Tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
        require('neotest').summary.open()
      end,
      desc = 'Run File',
    },
    {
      '<leader>Ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle Summary',
    },
    {
      '<leader>Tq',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop',
    },
    {
      '<leader>Ta',
      function()
        require('neotest').run.attach()
      end,
      desc = 'Attach',
    },
  },
}
