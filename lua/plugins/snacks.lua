return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      picker = {
        sources = {
          explorer = {
            layout = {
              preset = 'default',
              fullscreen = true,
              ---@diagnostic disable-next-line: assign-type-mismatch
              preview = { main = false, enabled = true },
            },
            auto_close = true,
          },
        },
        layout = function(source)
          if source == 'lines' then
            return 'ivy'
          else
            return { preset = 'default', fullscreen = true }
          end
        end,

        hidden = true,
        ui_select = true,
        formatters = {
          file = {
            truncate = 120,
          },
        },
      },
    },
    keys = {
      {
        '<leader>wt',
        function()
          Snacks.explorer()
        end,
        desc = 'Undo Last Notification Action',
      },
      {
        '<leader>nh',
        function()
          Snacks.notifier.show_history()
        end,
        desc = 'Notification History',
      },
      {
        '<leader>dr',
        function()
          Snacks.rename.rename_file()
        end,
        desc = '[d]ocument [r]ename',
      },
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git Browse',
        mode = { 'n', 'v' },
      },
      {
        '<leader>gb',
        function()
          Snacks.git.blame_line()
        end,
        desc = 'Git Blame Line',
      },
      {
        '<leader>nd',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },

      --- picker
      {
        '<leader>,',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find Buffers',
      },
      {
        '<leader>/',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep Current Buffer',
      },
      {
        '<leader>:',
        function()
          Snacks.picker.command_history()
        end,
        desc = 'Search Command History',
      },
      -- find
      {
        '<leader>fb',
        function()
          Snacks.picker.buffers()
        end,
        desc = '[F]ind [B]uffers',
      },
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
        desc = '[F]ind [F]iles',
      },
      -- git
      {
        '<leader>gc',
        function()
          Snacks.picker.git_log()
        end,
        desc = 'Search [G]it [C]ommits',
      },
      {
        '<leader>gs',
        function()
          Snacks.picker.git_status()
        end,
        desc = 'Search [G]it [S]tatus',
      },
      -- Grep
      {
        '<leader>sb',
        function()
          local Snacks = require 'snacks'
          Snacks.picker.lines { fullscreen = false }
        end,
        desc = '[S]earch [B]uffer Lines',
      },
      {
        '<leader>sB',
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = '[S]earch Open [B]uffers',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Search Visual Selection or [W]ord',
        mode = { 'n', 'x' },
      },
      -- search
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = '[S]earch Registers',
      },
      {
        '<leader>sa',
        function()
          Snacks.picker.autocmds()
        end,
        desc = '[S]earch [A]utocmds',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.command_history()
        end,
        desc = '[S]earch [C]ommand History',
      },
      {
        '<leader>sC',
        function()
          Snacks.picker.commands()
        end,
        desc = '[S]earch [C]ommands',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = '[S]earch [H]elp Pages',
      },
      {
        '<leader>sH',
        function()
          Snacks.picker.highlights()
        end,
        desc = '[S]earch [H]ighlights',
      },
      {
        '<leader>sj',
        function()
          Snacks.picker.jumps()
        end,
        desc = '[S]earch [J]umps',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = '[S]earch [K]eymaps',
      },
      {
        '<leader>sM',
        function()
          Snacks.picker.man()
        end,
        desc = '[S]earch [M]an Pages',
      },
      {
        '<leader>sR',
        function()
          Snacks.picker.resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = '[S]earch Workspace [S]ymbols',
      },
      {
        '<leader>sp',
        function()
          Snacks.picker.projects()
        end,
        desc = '[S]earch [P]rojects',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols {
            filter = {
              default = {
                'Class',
                'Constructor',
                'Enum',
                -- 'Field',
                'Function',
                'Interface',
                'Method',
                'Module',
                'Namespace',
                'Package',
                -- 'Property',
                'Struct',
                'Trait',
              },
            },
          }
        end,
        desc = '[S]earch LSP [S]ymbols',
      },
      -- LSP
      {
        'gd',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = '[G]oto [D]efinition',
      },
      {
        'gr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = '[G]oto [R]eferences',
      },
      {
        'gI',
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = '[G]oto Implementation',
      },
      {
        'gy',
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = '[G]oto T[y]pe Definition',
      },
      {
        '<leader>ws',
        function()
          Snacks.terminal.open 'search-tui'
        end,
        desc = '[S]earch/Replace In Workspace',
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Buffer [C]lose (no save)',
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>Ts'
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>Tw'
          Snacks.toggle.diagnostics():map '<leader>Td'
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>Tc'
          Snacks.toggle.treesitter():map '<leader>Tt'
          Snacks.toggle.indent():map '<leader>Ti'
          Snacks.toggle.dim():map '<leader>TD'
        end,
      })
    end,
  },
}
