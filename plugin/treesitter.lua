vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }

local nvim_treesitter = require 'nvim-treesitter'
nvim_treesitter.setup()

-- Modified version of https://github.com/cameronr/dotfiles/blob/efbef8e459cf1383bc8e265f5e9f81c7e90ba1aa/nvim/lua/plugins/treesitter.lua
-- from https://github.com/nvim-treesitter/nvim-treesitter/discussions/7927#discussioncomment-13819984
vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    local parsers = require 'nvim-treesitter.parsers'

    if not parsers[event.match] or not nvim_treesitter.install then
      return
    end

    local ft = vim.bo[event.buf].ft
    local lang = vim.treesitter.language.get_lang(ft)

    nvim_treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify('Treesitter install error for ft: ' .. ft .. ' err: ' .. err)
        return
      end

      pcall(vim.treesitter.start, event.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end)
  end,
})
