vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/joe-p/venv-selector.nvim', version = 'feat/snacks_layout' }
})

require('venv-selector').setup({
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
})

vim.keymap.set('n', '<leader>cv', '<cmd>VenvSelect<cr>', { desc = 'Select Python venv' })
