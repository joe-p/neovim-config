---
name: lazy-to-vim-pack
description: Convert Lazy.nvim plugins to vim.pack format
---

# Skill: Convert Lazy.nvim Plugins to vim.pack

When converting lazy.nvim plugins to vim.pack (Neovim's built-in plugin manager), follow these patterns:

## Basic Conversion Rules

### Plugin Source
- **lazy.nvim**: Uses short form `'owner/repo'` or full Git URL
- **vim.pack**: Always use full Git URL: `'https://github.com/owner/repo'`

### Simple Plugin (No Special Options)

**lazy.nvim:**
```lua
return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.basics').setup()
  end,
}
```

**vim.pack:**
```lua
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
require('mini.basics').setup()
```

### Plugin with Custom Name

**lazy.nvim:**
```lua
return {
  'catppuccin/nvim',
  name = 'catppuccin',
}
```

**vim.pack:**
```lua
vim.pack.add({ { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } })
```

### Plugin with Branch/Version

**lazy.nvim:**
```lua
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  -- or:
  version = '*',  -- latest semver tag
}
```

**vim.pack:**
```lua
vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } })
-- or for semver:
vim.pack.add({ { src = 'https://github.com/nvim-mini/mini.statusline', version = vim.version.range('*') } })
```

### Build/Update Hooks

**lazy.nvim:**
```lua
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}
```

**vim.pack:**
```lua
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } })
```

### Dependencies

**lazy.nvim:**
```lua
return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
```

**vim.pack:**
```lua
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' }
})
-- Load dependencies first, then the main plugin
```

## Fields to Remove (Not Supported in vim.pack)

Remove these lazy.nvim-specific fields entirely:
- `lazy` - vim.pack doesn't have lazy loading built-in
- `priority` - Not supported
- `dependencies` - Load dependencies explicitly before the plugin
- `cmd` - Use autocommands for command-based lazy loading
- `event` - Use autocommands for event-based lazy loading
- `keys` - Define keymaps directly in config
- `ft` - Use filetype autocommands
- `opts` - Call setup() explicitly after vim.pack.add()

## Lazy Loading (If Needed)

vim.pack supports lazy loading via autocommands. Example:

```lua
-- Load on InsertEnter
vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/nvim-mini/mini.completion' })
    require('mini.completion').setup()
  end,
})
```

## Configuration Pattern

1. Load plugin with `vim.pack.add({ source_url })`
2. Add any autocmd hooks BEFORE vim.pack.add()
3. Configure plugin immediately after (call setup(), set variables, etc.)
4. Define keymaps directly in the file

## Example: Complex Plugin Conversion

**lazy.nvim:**
```lua
return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = { 'LazyGit', 'LazyGitConfig' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.g.lazygit_floating_window_use_plenary = 1
    vim.api.nvim_create_autocmd('TermEnter', {
      callback = function()
        if string.find(vim.api.nvim_buf_get_name(0), 'lazygit') then
          vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = true })
        end
      end,
    })
  end,
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
}
```

**vim.pack:**
```lua
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' }
})

vim.g.lazygit_floating_window_use_plenary = 1

vim.api.nvim_create_autocmd('TermEnter', {
  callback = function()
    if string.find(vim.api.nvim_buf_get_name(0), 'lazygit') then
      vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = true })
    end
  end,
})

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
```

## Key Points

1. vim.pack.add() installs AND loads immediately (unless using custom load function)
2. Call setup() functions directly after vim.pack.add()
3. Dependencies must be listed before plugins that depend on them
4. Lockfile (nvim-pack-lock.json) handles version tracking
5. No built-in lazy loading - use autocommands if performance is critical
