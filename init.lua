require 'keymaps'
require 'options'
require 'diagnostic'
require 'autocmds'

vim.treesitter.language.register('python', 'sage')

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy '+',
      ['*'] = require('vim.ui.clipboard.osc52').copy '*',
    },
    -- Wezterm doesn't support paste via OSC 52, but neovim needs a full table for vim.g.clipboard
    paste = {
      ['+'] = function()
        return { vim.fn.split(vim.fn.getreg '"', '\n'), vim.fn.getregtype '"' }
      end,
      ['*'] = function()
        return { vim.fn.split(vim.fn.getreg '"', '\n'), vim.fn.getregtype '"' }
      end,
    },
  }

  vim.opt.clipboard = 'unnamedplus'
end)

local og_open = vim.ui.open

---@diagnostic disable-next-line: duplicate-set-field
vim.ui.open = function(uri)
  vim.notify(uri)
  og_open(uri)
  return { code = 0 }, nil
end
