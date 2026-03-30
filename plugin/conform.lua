vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    typescript = { 'prettier' },
    javascript = { 'prettier' },
    markdown = { 'mdformat' },
    json = { 'prettier' },
    c = { 'clang-format' },
    typst = { 'typstyle' },
    kotlin = { 'ktfmt' },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    if vim.fn.expand('%:e') == 'ipynb' then
      return
    end

    return {
      timeout_ms = 500,
      lsp_format = 'fallback',
    }
  end,
})

vim.keymap.set('n', '<leader>Tf', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
end, { desc = 'Toggle [F]ormat on save' })

vim.keymap.set('n', '<leader>TF', function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
end, { desc = 'Toggle [F]ormat on save for this buffer' })
