local opencode

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {}
    local Terminal = require('toggleterm.terminal').Terminal

    opencode = Terminal:new {
      cmd = 'opencode',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }
  end,
  keys = {
    {
      '<leader>ac',
      function()
        opencode:toggle()
      end,
      desc = 'Toggle opencode Terminal',
    },
  },
}
