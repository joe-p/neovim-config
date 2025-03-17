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
