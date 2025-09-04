return {
  'iofq/dart.nvim',
  dependencies = {
    'echasnovski/mini.nvim', -- optional, icons provider
    'nvim-tree/nvim-web-devicons', -- optional, icons provider
  },
  opts = {
    mappings = {
      mark = ' p', -- Mark current buffer
      jump = '  ', -- Jump to buffer marked by next character i.e `;a`
      pick = '', -- Open Dart.pick
      next = '', -- Cycle right through the tabline
      prev = '', -- Cycle left through the tabline
      unmark_all = '', -- Close all marked and recent buffers
    },
  }, -- see Configuration section
}
