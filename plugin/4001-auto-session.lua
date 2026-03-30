vim.pack.add({ 'https://github.com/rmagatti/auto-session' })

require('auto-session').setup({
  suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  git_use_branch_name = false,
  git_auto_restore_on_branch_change = false,
  show_auto_restore_notif = true,
  pre_save_cmds = {
    function()
      local dart = require('dart')
      local name = require('auto-session.lib').current_session_name()
      dart.write_session(name:gsub('/', '%%'))
    end,
  },
  post_restore_cmds = {
    function()
      local dart = require('dart')
      local name = require('auto-session.lib').current_session_name()
      dart.read_session(name:gsub('/', '%%'))
    end,
  },
})
