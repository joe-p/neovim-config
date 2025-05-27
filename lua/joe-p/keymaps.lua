---@diagnostic disable: undefined-global
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grn')

vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next { severity = { min = vim.diagnostic.severity.WARN } }
end, { desc = 'Next [D]iagnostic' })

vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev { severity = { min = vim.diagnostic.severity.WARN } }
end, { desc = 'Previous [D]iagnostic' })

vim.keymap.set('n', ']h', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.HINT }
end, { desc = 'Next [H]int' })

vim.keymap.set('n', '[h', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.HINT }
end, { desc = 'Previous [H]int' })

if vim.g.vscode then
  local vscode = require 'vscode'

  vim.keymap.set('n', 'gr', function()
    vim.lsp.buf.references()
  end)

  vim.keymap.set('n', '<leader>wt', function()
    vscode.call('workbench.files.action.showActiveFileInExplorer')
  end)

  -- open lazygit with <leader>gg
  vim.keymap.set('n', '<leader>gg', function()
    vscode.call('lazygit.openLazygit')
  end)

  -- diagnostic navigation
  vim.keymap.set('n', ']d', function()
    vscode.call('editor.action.marker.nextInFiles')
  end)

  vim.keymap.set('n', '[d', function()
    vscode.call('editor.action.marker.prevInFiles')
  end)

  -- code actions
  vim.keymap.set('n', '<leader>ca', function()
    vscode.call('editor.action.quickFix')
  end)

  -- rename symbol
  vim.keymap.set('n', '<leader>cr', function()
    vscode.call('editor.action.rename')
  end)

  -- workbench.action.quickOpen
  vim.keymap.set('n', '<leader>ff', function()
    vscode.call('workbench.action.quickOpen')
  end)

  local function select_workspace()
    local projects = {
      { path = os.getenv("HOME") .. "/.config/nvim", name = "nvim" },
    }

    local home = vim.env.HOME
    local git_dir = home .. "/git"
    local cmd = string.format(
      "/opt/homebrew/bin/fd --hidden --no-ignore ^.git$ --max-depth=3 --prune %s",
      git_dir
    )

    local output = vim.fn.system(cmd)

    -- Check if command was successful
    if vim.v.shell_error ~= 0 then
      vim.notify("Failed to run fd: " .. output, vim.log.levels.ERROR)
      return projects
    end

    -- Process each line of output
    for line in output:gmatch("([^\n]*)\n?") do
      if line ~= "" then
        local project = line:gsub("/.git.*$", "")
        local label = project
        local id = project:gsub(".*/", "")
        table.insert(projects, { path = tostring(label), name = tostring(id) })
      end
    end

    local prompt = "Select a repo"

    vim.ui.select(projects, {
      prompt = prompt,
      format_item = function(project)
        return project.name
      end,
    }, function(choice)
      if choice then
        vscode.eval([[
        vscode.commands.executeCommand(
          'vscode.openFolder',
          vscode.Uri.file(']] .. choice.path .. [['),
          { forceNewWindow: true }
        );
        ]])

      end
    end)
  end

  vim.keymap.set('n', '<leader>ww', select_workspace)
end
