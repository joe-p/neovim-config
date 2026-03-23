return {
  {
    'tadaa/vimade',
    enabled = true,
    opts = {
      recipe = { 'default', { animate = false } },
      ncmode = 'windows',
      fadelevel = 0.6,
      blocklist = {
        neotest = {
          buf_opts = { filetype = { 'neotest-summary' } },
        },
      },
    },
  },
}
