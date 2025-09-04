return {
  'rmagatti/auto-session',
  lazy = false,
  priority = 1000,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    pre_save_cmds = {
      function()
        local dart = require 'dart'
        local name = require('auto-session.lib').current_session_name()
        dart.write_session(name:gsub('/', '%%'))
      end,
    },
    post_restore_cmds = {
      function()
        local dart = require 'dart'
        local name = require('auto-session.lib').current_session_name()
        dart.read_session(name:gsub('/', '%%'))
      end,
    },
  },
}
