return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {}

    -- From https://www.reddit.com/r/neovim/s/Ibfxg6As5b
    vim.opt.diffopt = {
      'internal',
      'filler',
      'closeoff',
      'context:12',
      'algorithm:histogram',
      'linematch:200',
      'indent-heuristic',
    }
  end,
  keys = {
    {
      '<leader>gd',
      function()
        local view = require('diffview.lib').get_current_view()

        if view then
          vim.cmd 'DiffviewClose'
        else
          vim.cmd 'DiffviewOpen '
        end
      end,
      desc = 'Toggle [D]iffview',
    },
  },
}
