-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

if not vim.g.vscode then
  return { import = 'joe-p.plugins.neovim' }
end

return {}
