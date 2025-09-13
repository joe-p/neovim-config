return {
  'andrewferrier/debugprint.nvim',

  opts = {
    keymaps = {
      normal = {
        plain_below = '<leader>clp',
        plain_above = '<leader>clP',
        variable_below = '<leader>clv',
        variable_above = '<leader>clV',
        variable_below_alwaysprompt = '',
        variable_above_alwaysprompt = '',
        surround_plain = '<leader>clsp',
        surround_variable = '<leader>clsv',
        surround_variable_alwaysprompt = '',
        textobj_below = '<leader>clo',
        textobj_above = '<leader>clO',
        textobj_surround = '<leader>clso',
        toggle_comment_debug_prints = '',
        delete_debug_prints = '',
      },
      insert = {
        plain = '<C-G>p',
        variable = '<C-G>v',
      },
      visual = {
        variable_below = '<leader>clv',
        variable_above = '<leader>clV',
      },
    },
  },

  dependencies = {
    'nvim-mini/mini.hipatterns', -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)
  },

  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = '*', -- Remove if you DON'T want to use the stable version
}
