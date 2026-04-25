vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  { src = 'https://github.com/sudo-tee/opencode.nvim' },
}

require('render-markdown').setup {
  anti_conceal = { enabled = false },
  file_types = { 'opencode_output' },
}

require('opencode').setup {
  default_mode = 'plan',
  preferred_picker = 'snacks',
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
    diagnostics = false,
    current_file = {
      enabled = false, -- Include current file path and content in the context
    },
    selection = {
      enabled = true, -- Include selected text in the context
    },
  },
}
