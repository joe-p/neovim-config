return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>cr', vim.lsp.buf.rename, '[R]ename')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end
      end,
    })

    vim.lsp.config('rust_analyzer', {
      settings = {
        ['rust-analyzer'] = {
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
              enable = true, -- show closure capture info
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
      cmd = { 'puyats-ls', '--stdio' },
      filetypes = {
        'typescript',
      },
      root_dir = function(bufnr, on_dir)
        -- If the file is an algo.ts file, we'll attach the LSP using the same root_dir as vtsls
        if vim.fn.bufname(bufnr):match '%.algo.ts$' then
          vim.lsp.config.vtsls.root_dir(bufnr, function(project_root)
            on_dir(project_root)
          end)
        end
      end,
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
    }

    for _, lsp in ipairs(enabled_lsps) do
      vim.lsp.enable(lsp)
    end
  end,
}
