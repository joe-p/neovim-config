return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = '+' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
          if vim.wo.diff then
            vim.cmd.normal { ']g', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next [g]it change' })

        map('n', '[g', function()
          if vim.wo.diff then
            vim.cmd.normal { '[g', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous [g]it change' })

        -- Actions
        -- visual mode
        map('v', '<leader>Hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>Hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [r]eset hunk' })
        -- normal mode
        map('n', '<leader>Hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>Hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>HS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>Hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>HR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>Hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>Hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>Hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>HD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>TG', gitsigns.toggle_current_line_blame, { desc = '[T]oggle [G]it show blame line' })
        map('n', '<leader>Tg', gitsigns.toggle_deleted, { desc = '[T]oggle [g]it show deleted' })
      end,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
