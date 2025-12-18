return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = {
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
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      if vim.fn.expand '%:e' == 'ipynb' then
        return
      end

      return {
        filter = function(client)
          return client.name ~= 'ts_ls'
        end,
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end,
  },
  keys = {
    {
      '<leader>Tf',
      function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end,
      desc = 'Toggle [F]ormat on save',
    },
    {
      '<leader>TF',
      function()
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      end,
      desc = 'Toggle [F]ormat on save for this buffer',
    },
  },
}
