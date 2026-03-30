vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<leader>cr', vim.lsp.buf.rename, '[R]ename')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
  end,
})

vim.lsp.config('sourcekit', { filetypes = { 'swift', 'objective-c', 'objective-cpp' } })

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      procMacro = {
        enable = true,
        attributes = {
          enable = true,
        },
      },
      checkOnSave = true,
      check = {
        command = 'clippy',
      },
      inlayHints = {
        typeHints = {
          enable = false,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureCaptureHints = {
          enable = true,
        },
      },
    },
  },
})

vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'basic',
        autoImportCompletions = true,
      },
    },
  },
})

vim.lsp.config('puyats-ls', {
  cmd = { 'npx', 'puyats-ls', '--stdio' },
  filetypes = {
    'typescript',
  },
  root_dir = function(bufnr, on_dir)
    if vim.fn.bufname(bufnr):match('%.algo.ts$') then
      vim.lsp.config.vtsls.root_dir(bufnr, function(project_root)
        on_dir(project_root)
      end)
    end
  end,
})

vim.lsp.config('harper_ls', {
  settings = {
    ['harper-ls'] = {
      linters = {
        ToDoHyphen = false,
        OrthographicConsistency = false,
        SentenceCapitalization = false,
        Dashes = false,
        ExpandMemoryShorthands = false,
      },
    },
  },
})

local enabled_lsps = {
  'lua_ls',
  'gopls',
  'vtsls',
  'rust_analyzer',
  'basedpyright',
  'circom-lsp',
  'sourcekit',
  'harper_ls',
  'zls',
  'puyats-ls',
  'clangd',
  'kotlin_lsp',
}

for _, lsp in ipairs(enabled_lsps) do
  vim.lsp.enable(lsp)
end
