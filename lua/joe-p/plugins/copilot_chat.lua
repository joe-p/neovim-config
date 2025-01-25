return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    opts = {
      model = 'claude-3.5-sonnet',
    },
    keys = {
      { '<leader>ae', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code', mode = { 'n', 'v' } },
      { '<leader>at', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests', mode = { 'n', 'v' } },
      { '<leader>ar', '<cmd>CopilotChatReview<cr>', desc = 'CopilotChat - Review code', mode = { 'n', 'v' } },
      { '<leader>ac', '<cmd>CopilotChatToggle<cr>', desc = 'Toggle [C]opilot Chat', mode = { 'n', 'v' } },
    },
    dependencies = {
      {
        'zbirenbaum/copilot.lua', -- for providers='copilot'
        opts = {
          model = 'claude-3.5-sonnet',
        },
        config = function(_, opts)
          require('copilot').setup(opts)
          vim.cmd 'Copilot auth'
        end,
      },
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
  },
}
