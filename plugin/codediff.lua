vim.pack.add({
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/esmuellert/codediff.nvim' }
})

require('codediff').setup({
  explorer = {
    view_mode = 'tree',
  },
  keymaps = {
    view = {
      next_hunk = ']g',
      prev_hunk = '[g',
    },
  },
})
