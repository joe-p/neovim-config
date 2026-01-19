return {
  'clabby/difftastic.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('difftastic-nvim').setup {
      download = true, -- Auto-download pre-built binary
      vcs = 'git',
    }
  end,
}
