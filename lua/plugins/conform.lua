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
    },
    format_on_save = {
      filter = function(client)
        return client.name ~= 'ts_ls'
      end,
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
