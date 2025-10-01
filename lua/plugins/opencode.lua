return {
  'sudo-tee/opencode.nvim',
  config = function()
    require('opencode').setup {}
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        anti_conceal = { enabled = false },
        file_types = { 'opencode_output' },
      },
      ft = { 'Avante', 'copilot-chat', 'opencode_output' },
    },
  },
}
