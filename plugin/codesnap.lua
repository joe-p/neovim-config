-- See https://github.com/mistricky/codesnap.nvim/issues/162#issuecomment-4166538711
vim.defer_fn(function()
  vim.pack.add { 'https://github.com/mistricky/codesnap.nvim' }
  require('codesnap').setup {}
end, 50)
