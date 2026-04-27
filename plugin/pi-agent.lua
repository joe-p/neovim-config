vim.pack.add {
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  { src = '/Users/joe/git/joe-p/pi-agent.nvim' },
}

require('render-markdown').setup {
  anti_conceal = { enabled = false },
  file_types = { 'pichat' },
}

require('pi').setup {
  keymaps = {
    close = 'jk',
  },
}

vim.keymap.set('n', '<leader>pi', '<cmd>PiToggle<CR>')
