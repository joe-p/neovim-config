return {
  'sudo-tee/opencode.nvim',
  config = function()
    require('opencode').setup {
      keymap = {
        input_window = {
          ['jk'] = { 'close' }, -- Close UI windows
          ['<tab>'] = { 'switch_mode' }, -- Switch between modes (build/plan)
        },
        output_window = {
          ['jk'] = { 'close' }, -- Close UI windows
        },
      },
      context = {
        enabled = true, -- Enable automatic context capturing
        cursor_data = {
          enabled = false, -- Include cursor position and line content in the context
        },
        diagnostics = {
          info = false, -- Include diagnostics info in the context (default to false
          warn = false, -- Include diagnostics warnings in the context
          error = false, -- Include diagnostics errors in the context
        },
        current_file = {
          enabled = true, -- Include current file path and content in the context
        },
        selection = {
          enabled = false, -- Include selected text in the context
        },
      },
    }
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
