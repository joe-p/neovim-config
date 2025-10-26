local function is_toggleterm_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bt = vim.bo[buf].buftype
    local ft = vim.bo[buf].filetype
    if bt == 'terminal' and ft == 'toggleterm' then
      return true
    end
  end
  return false
end

local function num_mappings()
  local mappings = {}
  for i = 1, 10 do
    local key = i
    if i == 10 then
      key = 0
    end

    table.insert(mappings, {
      '<leader>j' .. key,
      function()
        local terms = require 'toggleterm'
        if is_toggleterm_open() then
          terms.toggle()
        end
        terms.toggle(i)
      end,
      desc = 'Toggle terminal ' .. i,
    })
  end

  return mappings
end

local keys = {
  {
    '<leader>jj',
    function()
      require('toggleterm').toggle()
    end,
    desc = 'Toggle terminal',
  },
}

keys = vim.list_extend(keys, num_mappings())

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
    shade_terminals = false,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*toggleterm#*',
      callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', 'jk', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Close ToggleTerm with jk' })
      end,
    })
  end,
  keys = keys,
}
