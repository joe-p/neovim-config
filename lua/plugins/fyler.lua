return {
  'A7Lavinraj/fyler.nvim',
  dependencies = { 'nvim-mini/mini.icons' },
  branch = 'stable',
  ---@module 'fyler'
  ---@type FylerSetupOptions
  opts = {},
  keys = {
    { '<leader>wf', '<cmd>Fyler<cr>', desc = 'Open Fyler' },
  },
}
