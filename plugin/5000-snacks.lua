vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
  bigfile = { enabled = false },
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
})

-- Keymaps
vim.keymap.set('n', '<leader>wt', function()
  Snacks.explorer()
end, { desc = 'Undo Last Notification Action' })

vim.keymap.set('n', '<leader>nh', function()
  Snacks.notifier.show_history()
end, { desc = 'Notification History' })

vim.keymap.set('n', '<leader>dr', function()
  Snacks.rename.rename_file()
end, { desc = '[d]ocument [r]ename' })

vim.keymap.set({ 'n', 'v' }, '<leader>gB', function()
  Snacks.gitbrowse({ what = 'permalink' })
end, { desc = 'Git Browse' })

vim.keymap.set('n', '<leader>gb', function()
  Snacks.git.blame_line()
end, { desc = 'Git Blame Line' })

vim.keymap.set('n', '<leader>nd', function()
  Snacks.notifier.hide()
end, { desc = 'Dismiss All Notifications' })

-- Picker keymaps
vim.keymap.set('n', '<leader>,', function()
  Snacks.picker.buffers()
end, { desc = 'Find Buffers' })

vim.keymap.set('n', '<leader>/', function()
  Snacks.picker.grep()
end, { desc = 'Grep Current Buffer' })

vim.keymap.set('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = 'Search Command History' })

-- Find
vim.keymap.set('n', '<leader>fb', function()
  Snacks.picker.buffers()
end, { desc = '[F]ind [B]uffers' })

vim.keymap.set('n', '<leader>ff', function()
  Snacks.picker.files({ hidden = true })
end, { desc = '[F]ind [F]iles' })

-- Git
vim.keymap.set('n', '<leader>gc', function()
  Snacks.picker.git_log()
end, { desc = 'Search [G]it [C]ommits' })

vim.keymap.set('n', '<leader>gs', function()
  Snacks.picker.git_status()
end, { desc = 'Search [G]it [S]tatus' })

-- Grep
vim.keymap.set('n', '<leader>sb', function()
  Snacks.picker.lines({ fullscreen = false })
end, { desc = '[S]earch [B]uffer Lines' })

vim.keymap.set('n', '<leader>sB', function()
  Snacks.picker.grep_buffers()
end, { desc = '[S]earch Open [B]uffers' })

vim.keymap.set({ 'n', 'x' }, '<leader>sw', function()
  Snacks.picker.grep_word()
end, { desc = 'Search Visual Selection or [W]ord' })

-- Search
vim.keymap.set('n', '<leader>s"', function()
  Snacks.picker.registers()
end, { desc = '[S]earch Registers' })

vim.keymap.set('n', '<leader>sa', function()
  Snacks.picker.autocmds()
end, { desc = '[S]earch [A]utocmds' })

vim.keymap.set('n', '<leader>sc', function()
  Snacks.picker.command_history()
end, { desc = '[S]earch [C]ommand History' })

vim.keymap.set('n', '<leader>sC', function()
  Snacks.picker.commands()
end, { desc = '[S]earch [C]ommands' })

vim.keymap.set('n', '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sh', function()
  Snacks.picker.help()
end, { desc = '[S]earch [H]elp Pages' })

vim.keymap.set('n', '<leader>sH', function()
  Snacks.picker.highlights()
end, { desc = '[S]earch [H]ighlights' })

vim.keymap.set('n', '<leader>sj', function()
  Snacks.picker.jumps()
end, { desc = '[S]earch [J]umps' })

vim.keymap.set('n', '<leader>sk', function()
  Snacks.picker.keymaps()
end, { desc = '[S]earch [K]eymaps' })

vim.keymap.set('n', '<leader>sM', function()
  Snacks.picker.man()
end, { desc = '[S]earch [M]an Pages' })

vim.keymap.set('n', '<leader>sR', function()
  Snacks.picker.resume()
end, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>sS', function()
  Snacks.picker.lsp_workspace_symbols()
end, { desc = '[S]earch Workspace [S]ymbols' })

vim.keymap.set('n', '<leader>sp', function()
  Snacks.picker.projects()
end, { desc = '[S]earch [P]rojects' })

vim.keymap.set('n', '<leader>ss', function()
  Snacks.picker.lsp_symbols({
    filter = {
      default = {
        'Class',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Method',
        'Module',
        'Namespace',
        'Package',
        'Struct',
        'Trait',
      },
    },
  })
end, { desc = '[S]earch LSP [S]ymbols' })

-- LSP
vim.keymap.set('n', 'gd', function()
  Snacks.picker.lsp_definitions()
end, { desc = '[G]oto [D]efinition' })

vim.keymap.set('n', 'gr', function()
  Snacks.picker.lsp_references()
end, { desc = '[G]oto [R]eferences', nowait = true })

vim.keymap.set('n', 'gI', function()
  Snacks.picker.lsp_implementations()
end, { desc = '[G]oto Implementation' })

vim.keymap.set('n', 'gy', function()
  Snacks.picker.lsp_type_definitions()
end, { desc = '[G]oto T[y]pe Definition' })

vim.keymap.set('n', '<leader>ws', function()
  Snacks.terminal.open('search-tui')
end, { desc = '[S]earch/Replace In Workspace' })

vim.keymap.set('n', '<leader>bd', function()
  Snacks.bufdelete()
end, { desc = 'Buffer [C]lose (no save)' })

-- Setup debug globals and toggle mappings
-- Setup some globals for debugging
_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd -- Override print to use snacks for `:=` command

-- Create some toggle mappings
Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>Ts')
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>Tw')
Snacks.toggle.diagnostics():map('<leader>Td')
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map('<leader>Tc')
Snacks.toggle.treesitter():map('<leader>Tt')
Snacks.toggle.indent():map('<leader>Ti')
Snacks.toggle.dim():map('<leader>TD')
