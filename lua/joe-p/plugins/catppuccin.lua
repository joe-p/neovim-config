return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'macchiato',
      },
      default_integrations = true,
      integrations = {
        blink_cmp = true,
        grug_far = true,
        diffview = true,
        neotest = true,
        snacks = {
          enabled = true,
        },
        which_key = true,
        notify = true,
      },
    }
  end,
}
