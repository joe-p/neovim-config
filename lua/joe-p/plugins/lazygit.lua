return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  config = function()
    vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
    vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    vim.g.lazygit_use_custom_config_file_path = 1 -- config file path is evaluated if this value is 1
    vim.g.lazygit_config_file_path = vim.fn.expand '$HOME/.config/lazygit/config.yml'
  end,
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
}
