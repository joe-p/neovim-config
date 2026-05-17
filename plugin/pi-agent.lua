vim.pack.add {
  { src = 'https://github.com/joe-p/pi-agent.nvim' },
}

require('pi-agent').setup {
  keymaps = {
    close = 'jk',
    commands = {
      ['<Tab>'] = 'plan',
    },
  },
}

vim.keymap.set('n', '<leader>pi', '<cmd>PiToggle<CR>')
