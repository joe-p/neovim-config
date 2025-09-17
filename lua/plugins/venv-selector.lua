return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { '<leader>cv', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = { -- this can be an empty lua table - just showing below for clarity.
    options = {
      picker = 'snacks',
    },
  },
}
