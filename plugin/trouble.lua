vim.pack.add({ 'https://github.com/folke/trouble.nvim' })
require('trouble').setup()

vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle focus=true<cr>', { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
