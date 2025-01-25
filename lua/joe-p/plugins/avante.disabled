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
      provider = 'claude',

      -- Anthropic API
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-3-5-sonnet-20241022',
        api_key_name = 'cmd:op read op://Personal/anthropic_avante.nvim/credential --no-newline',
      },

      -- fireworks deepseekv3
      -- openai = {
      --   endpoint = 'https://api.fireworks.ai/inference/v1',
      --   model = 'accounts/fireworks/models/deepseek-v3',
      --   api_key_name = 'cmd:op read op://Personal/fireworks_deepseekv3_avante.nvim/credential --no-newline',
      -- },

      -- deepseek API
      -- openai = {
      --   endpoint = 'https://api.deepseek.com',
      --   model = 'deepseek-chat',
      --   api_key_name = 'cmd:op read op://Personal/deepseek_avante.nvim/credential --no-newline',
      -- },

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
      --- TODO: Once the next release includes the snacks provider, remove this dependency
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
    },
  },
}
