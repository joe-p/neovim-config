require 'keymaps'
require 'options'
require 'diagnostic'
require 'autocmds'
-- for _, file in ipairs(vim.fn.glob(vim.fn.stdpath 'config' .. '/lua/pack/*.lua', false, true)) do
--   local plugin_name = vim.fn.fnamemodify(file, ':t:r')
--   require('pack.' .. plugin_name)
-- end
