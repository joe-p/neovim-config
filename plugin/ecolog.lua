vim.pack.add({ { src = 'https://github.com/ph1losof/ecolog.nvim', version = 'v1' } })

require('ecolog').setup({
  integrations = {
    nvim_cmp = false,
    blink_cmp = true,
  },
  shelter = {
    configuration = {
      partial_mode = false,
      mask_char = '*',
      mask_length = nil,
      skip_comments = false,
    },
    modules = {
      cmp = true,
      peek = false,
      files = true,
      telescope = false,
      telescope_previewer = false,
      fzf = false,
      fzf_previewer = false,
      snacks_previewer = true,
      snacks = true,
    },
  },
  types = true,
  path = vim.fn.getcwd(),
  preferred_environment = 'development',
  provider_patterns = true,
})

vim.keymap.set('n', '<leader>ge', '<cmd>EcologGoto<cr>', { desc = 'Go to env file' })
vim.keymap.set('n', '<leader>ep', '<cmd>EcologPeek<cr>', { desc = 'Ecolog peek variable' })
vim.keymap.set('n', '<leader>es', '<cmd>EcologSelect<cr>', { desc = 'Switch env file' })
