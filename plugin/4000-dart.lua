vim.pack.add({ 'https://github.com/iofq/dart.nvim' })

require('dart').setup({
  mappings = {
    mark = '<leader>p',
    jump = '<leader> ',
    pick = '',
    next = '',
    prev = '',
    unmark_all = '',
  },
  tabline = {
    order = function(config)
      local order = {}
      for i, key in ipairs(vim.list_extend(vim.deepcopy(config.marklist), config.buflist)) do
        order[key] = i
      end
      return order
    end,
  },
})

vim.api.nvim_set_hl(0, 'DartCurrent', { underline = false, undercurl = false })
local hl = vim.api.nvim_get_hl(0, { name = 'DartCurrent', link = false })
vim.api.nvim_set_hl(0, 'DartCurrentLabel', { fg = 'orange', bold = true, bg = hl.bg })
