vim.pack.add({ 'https://github.com/Wansmer/treesj' })

vim.keymap.set('n', '<leader>cs', function()
  require('treesj').toggle({ split = { recursive = true } })
end, { desc = 'Toggle split/join' })
