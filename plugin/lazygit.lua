vim.pack.add { { src = 'https://github.com/nvim-lua/plenary.nvim' }, { src = 'https://github.com/kdheepak/lazygit.nvim' } }

vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
vim.env.GIT_EDITOR = 'nvr -cc split --remote-wait'
vim.g.lazygit_use_custom_config_file_path = 1 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = vim.fn.expand '$HOME/.config/lazygit/config.yml'

-- Disable <esc> keybinds in lazygit
-- Useful in combination with `quitOnTopLevelReturn: true` in lazygit config
vim.api.nvim_create_autocmd('TermEnter', {
  callback = function()
    if string.find(vim.api.nvim_buf_get_name(0), 'lazygit') then
      vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = true })
      vim.keymap.set('t', '<Esc><Esc>', '<Esc><Esc>', { buffer = true })
      vim.keymap.set('t', 'jk', '<Esc><Esc>', { buffer = true })
    end
  end,
})

vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>', { desc = 'LazyGit' })
