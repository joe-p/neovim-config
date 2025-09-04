return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  keys = {
    {
      '<leader>cs',
      function()
        require('treesj').toggle { split = { recursive = true } }
      end,
      desc = 'Toggle split/join',
    },
  },
}
