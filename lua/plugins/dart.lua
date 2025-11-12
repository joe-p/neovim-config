return {
  'iofq/dart.nvim',
  lazy = false,
  priority = 1001,
  dependencies = {
    'echasnovski/mini.nvim', -- optional, icons provider
    'nvim-tree/nvim-web-devicons', -- optional, icons provider
  },
  opts = {
    mappings = {
      mark = '<leader>p', -- Mark current buffer
      jump = '<leader> ', -- Jump to buffer marked by next character i.e `;a`
      pick = '', -- Open Dart.pick
      next = '', -- Cycle right through the tabline
      prev = '', -- Cycle left through the tabline
      unmark_all = '', -- Close all marked and recent buffers
    },
    tabline = {
      -- put pinned buffers first
      order = function(config)
        local order = {}
        for i, key in ipairs(vim.list_extend(vim.deepcopy(config.marklist), config.buflist)) do
          order[key] = i
        end
        return order
      end,
    },
  }, -- see Configuration section
  config = function(_, opts)
    require('dart').setup(opts)

    vim.api.nvim_set_hl(0, 'DartCurrent', { underline = false, undercurl = false })
    local hl = vim.api.nvim_get_hl(0, { name = 'DartCurrent', link = false })
    vim.api.nvim_set_hl(0, 'DartCurrentLabel', { fg = 'orange', bold = true, bg = hl.bg })
  end,
}
