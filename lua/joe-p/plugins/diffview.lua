return {
  'sindrets/diffview.nvim',
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
