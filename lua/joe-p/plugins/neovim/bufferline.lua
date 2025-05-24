return {
  {
    'akinsho/bufferline.nvim',
    after = 'catppuccin',
    lazy = false,
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<leader>p', '<cmd>BufferLineTogglePin<CR>', desc = 'Toggle Buffer [P]in' },
      { '<leader> ', '<cmd>BufferLinePick<CR>', desc = 'Pick Buffer' },
      { '<leader>bC', '<cmd>BufferLinePickClose<CR>', desc = 'Pick Buffer and [C]lose' },
      {
        '<leader>bc',
        function()
          require('snacks').bufdelete.delete()
        end,
        desc = '[C]lose Buffer',
      },
    },
    config = function()
      local bufferline = require 'bufferline'
      local snacks = require 'snacks'
      bufferline.setup {
        highlights = require('catppuccin.groups.integrations.bufferline').get(),
        options = {
          diagnostics = 'nvim_lsp',
          always_show_bufferline = true,
          close_command = function(buf_num)
            snacks.bufdelete.delete(buf_num)
          end,
        },
      }
      local wk = require 'which-key'
      wk.add {
        '<leader>bo',
        -- From https://github.com/akinsho/bufferline.nvim/issues/736#issuecomment-1680237187
        function()
          local current = vim.api.nvim_get_current_buf()
          vim.schedule(function()
            for _, e in ipairs(bufferline.get_elements().elements) do
              local is_current = e.id == current
              local is_pinned = bufferline.groups._is_pinned(e)
              if not is_current and not is_pinned then
                snacks.bufdelete.delete(e.id)
              end
            end
          end)
        end,
        desc = 'Close [O]ther Non-Pinned Buffers',
      }
      -- Use <leader>N to go to Nth buffer
      -- Use <leader>bN to move to Nth buffer
      for buf_num = 1, 9 do
        wk.add {
          {
            string.format('<leader>%d', buf_num),
            string.format('<cmd>BufferLineGoToBuffer %d<CR>', buf_num),
            desc = string.format('Go to Buffer %d', buf_num),
            hidden = true,
          },
          {
            string.format('<leader>b%d', buf_num),
            function()
              bufferline.move_to(buf_num)
            end,
            desc = string.format('Move Buffer to %d', buf_num),
            hidden = true,
          },
        }
      end
    end,
  },
}
