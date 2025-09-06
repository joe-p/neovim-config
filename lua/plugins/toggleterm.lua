return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = true,
  config = function()
    require('toggleterm').setup {
      open_mapping = nil,
    }

    local Terminal = require('toggleterm.terminal').Terminal
    local float_term = Terminal:new { direction = 'float' }
    local horizontal_term = Terminal:new { direction = 'horizontal' }
    local vert_term = Terminal:new { direction = 'vertical', size = 50 }

    local function toggle_vert_term()
      if vert_term:is_open() then
        vert_term:close()
      else
        local size = math.floor(vim.api.nvim_win_get_width(0) * 0.5)
        vert_term:open()
        vert_term:resize(size)
      end
    end

    vim.keymap.set('n', '<leader>jf', function()
      float_term:toggle()
    end, { desc = 'Toggle floating terminal' })

    vim.keymap.set('n', '<leader>jh', function()
      horizontal_term:toggle()
    end, { desc = 'Toggle horizontal terminal' })

    vim.keymap.set('n', '<leader>jj', toggle_vert_term, { desc = 'Toggle vertical terminal' })

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*toggleterm#*',
      callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<Esc>', [[<Cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<Esc><Esc><Esc>', [[<Cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
      end,
    })
  end,
}
