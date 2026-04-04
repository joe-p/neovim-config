-- See https://github.com/mistricky/codesnap.nvim/issues/162#issuecomment-4166538711
vim.defer_fn(function()
  vim.pack.add { 'https://github.com/mistricky/codesnap.nvim' }
  require('codesnap').setup {
    background = '#00000000',
    snapshot_config = {
      window = {
        margin = {
          x = 0,
          y = 0,
        },
      },
      code_config = {
        font_family = 'MesloLGM Nerd Font Mono',
        breadcrumbs = {
          enable = false,
        },
      },
    },
  }
end, 100)
