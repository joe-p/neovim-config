return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = { query = '@function.outer', desc = 'Next [f]unction' },
              [']c'] = { query = '@class.outer', desc = 'Next [c]lass' },
              [']C'] = { query = '@conditional.outer', desc = 'Next [C]onditional' },
              [']]'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope' },
              [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
            },
            goto_previous_start = {
              ['[f'] = { query = '@function.outer', desc = 'Previous [f]unction' },
              ['[c'] = { query = '@class.outer', desc = 'Previous [c]lass' },
              ['[['] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope' },
              ['[C'] = { query = '@conditional.outer', desc = 'Previous [C]onditional' },
            },
          },
        },
      }
    end,
  },
}
