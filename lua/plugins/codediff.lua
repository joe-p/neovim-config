return {
  'esmuellert/codediff.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  cmd = 'CodeDiff',
  config = function()
    require('codediff').setup {
      -- Explorer panel configuration
      explorer = {
        view_mode = 'tree', -- "list" or "tree"
      },

      -- Keymaps in diff view
      keymaps = {
        view = {
          next_hunk = ']g', -- Jump to next change
          prev_hunk = '[g', -- Jump to previous change
        },
      },
    }
  end,
}
