return {
  {
    'tadaa/vimade',
    opts = {
      recipe = { 'default', { animate = false } },
      ncmode = 'windows',
      fadelevel = 0.5,
      blocklist = {
        neotest = {
          buf_opts = { filetype = { 'neotest-summary' } },
        },
      },
    },
  },
}
