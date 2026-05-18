vim.pack.add { 'https://github.com/folke/trouble.nvim' }

require('trouble').setup {
  modes = {
    code_diags = {
      mode = 'diagnostics',
      focus = true,
      filter = function(items)
        return vim.tbl_filter(function(item)
          return item.item.source ~= 'Harper'
        end, items)
      end,
    },
    buf_code_diags = {
      mode = 'diagnostics',
      focus = true,
      filter = function(items)
        return vim.tbl_filter(function(item)
          return item.buf == 0 and item.item.source ~= 'Harper'
        end, items)
      end,
    },
  },
}

vim.keymap.set('n', '<leader>xX', '<cmd>Trouble code_diags<cr>', { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble buf_code_diags<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
