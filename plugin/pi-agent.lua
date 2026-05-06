vim.pack.add {
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  { src = 'https://github.com/joe-p/pi-agent.nvim' },
}

require('render-markdown').setup {
  anti_conceal = { enabled = false },
  file_types = { 'pichat' },
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
