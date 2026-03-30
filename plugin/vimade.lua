vim.pack.add({ 'https://github.com/tadaa/vimade' })
require('vimade').setup({
  link = {
    opencode = function(win, active)
      local win_ft = win.buf_opts.filetype
      local active_ft = active.buf_opts.filetype

      return win_ft == ('opencode' and active_ft == 'opencode_output') or (win_ft == 'opencode_output' and active_ft == 'opencode')
    end,
  },
  recipe = { 'default', { animate = false } },
  ncmode = 'windows',
  fadelevel = 0.6,
  blocklist = {
    neotest = {
      buf_opts = { filetype = { 'neotest-summary' } },
    },
  },
})
