return {
  'joe-p/venv-selector.nvim',
  branch = 'feat/snacks_layout',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { '<leader>cv', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = { -- this can be an empty lua table - just showing below for clarity.
    search = {
      pipx = false,
    },
    options = {
      picker = 'snacks',
      picker_options = {
        snacks = {
          layout = { preset = 'default', preview = { main = false, enabled = false }, fullscreen = false },
        },
      },
    },
  },
}
