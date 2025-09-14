local function stick_term_win()
  if vim.bo.filetype ~= 'better_term' then
    return
  end
  local stickybuf = require 'stickybuf'

  stickybuf.pin(vim.api.nvim_get_current_win(), { allow_type = 'filetype' })
end

return {
  'CRAG666/betterTerm.nvim',
  opts = {
    position = 'vert',
  },
  dependencies = { 'stevearc/stickybuf.nvim' },
  config = function(_, opts)
    require('betterTerm').setup(opts)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'better_term', -- change to your filetype
      callback = function()
        vim.keymap.set('t', '<esc><esc><esc>', function()
          require('betterTerm').open()
        end, { buffer = true })

        vim.keymap.set('n', '<esc>', function()
          require('betterTerm').open()
        end, { buffer = true })

        vim.keymap.set('n', 'jk', function()
          require('betterTerm').open()
        end, { buffer = true })

        vim.keymap.set('n', 'kj', function()
          require('betterTerm').open()
        end, { buffer = true })
      end,
    })
  end,
  keys = (function()
    local keys = {
      {
        '<leader>jj',
        function()
          local betterTerm = require 'betterTerm'
          betterTerm.open()
          stick_term_win()
        end,
        desc = 'Open BetterTerm',
      },
    }

    for i = 0, 9 do
      table.insert(keys, {
        '<leader>' .. i,
        function()
          local betterTerm = require 'betterTerm'
          betterTerm.open(i)
          stick_term_win()
        end,
        desc = 'Open BetterTerm ' .. i,
      })
    end

    return keys
  end)(),
}
