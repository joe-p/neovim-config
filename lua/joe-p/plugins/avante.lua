return {
  {
    'yetone/avante.nvim',
    -- lazy load when first using avante to prevent 1password prompt from happening every time we start neovim
    lazy = true,
    cmd = { 'AvanteAsk', 'AvanteToggle', 'AvanteChat' },
    keys = {
      { '<leader>aa', '<cmd>AvanteToggle<cr>', desc = 'Toggle Avante' },
    },
    version = '*', -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      provider = 'claude', -- Recommend using Claude
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-3-5-sonnet-20241022',
        api_key_name = 'cmd:op read op://Personal/anthropic_avante.nvim/credential --no-newline',
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
