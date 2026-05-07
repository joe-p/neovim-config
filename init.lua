require 'keymaps'
require 'options'
require 'diagnostic'
require 'autocmds'

local function is_ssh()
  return vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil or vim.env.SSH_TTY ~= nil
end

vim.treesitter.language.register('python', 'sage')

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  if is_ssh() then
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
  end

  vim.opt.clipboard = 'unnamedplus'
end)

if is_ssh() then -- print the URL in a notification so it can be opened on SSH client
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.ui.open = function(uri)
    vim.notify(uri)
    return { code = 0 }, nil
  end
end
