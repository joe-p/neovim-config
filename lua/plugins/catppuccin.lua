return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 10000,
  config = function()
    require('catppuccin').setup {
      float = { transparent = false, solid = false },
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'macchiato',
      },
      auto_integrations = true,
      default_integrations = true,
    }

    vim.o.background = 'dark'
    vim.cmd.colorscheme 'catppuccin'
  end,
}
