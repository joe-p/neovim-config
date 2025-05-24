return -- Lua
{
  'f-person/auto-dark-mode.nvim',
  lazy = false,
  opts = {
    set_dark_mode = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'catppuccin'
    end,
    set_light_mode = function()
      vim.o.background = 'light'
      vim.cmd 'colorscheme kanso-pearl'
    end,
  },
}
