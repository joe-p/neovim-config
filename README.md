# kickstart.vim

This is a fork of [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) which is a fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). 

I have made some changes to the original kickstart files but most of the changes I've made (i.e. plugins I've added) can be found in [lua/joe-p](./lua/joe-p). If you want to add your own plugins, it is recommended to make a directory with your GitHub username to prevent merge conflicts from my repo and upstream. 

To use this configuration, simply clone this repo as `~/.config/nvim` or use [$NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) to try this configuration without affecting your existing config.


## Kickstart Changes

* `nvim-cmp`: Removed snippets since they add a lot of noise and I don't use them often
* `nvim-cmp`: Use enter to confirm completion suggestion
* `gitsigns`: Modified signs to be more like the default config, with the exception of using `+` for additions
* `gitsigns`: Use `]g` and `[g` to jump between git changes
* `gitsigns`: Use `<leader>H` instead of `<leader>h` for hunk actions since `h` is used for harpoon
* `gitsigns`: Use `<leader>tg` and `<leader>tG` to toggle show deleted and current line blame
* `gitsigns`: Enable current line blame by default
* `telescope`: Removed in favor of `Snacks.picker`
* `lspconfig`: Removed telescope bindings in favor of `Snacks.picker`
* `lspconfig`: Rename is now `<leader>cr`
* `lspconfig`: Disable inlay hints (now handled by `tiny-inline-diagnostic.nvim`)
* `lspconfig`: Add `ts_ls`, `gopls`, and `rust_analyzer`
* `tokyonight`: Use `tokyonight-moon`
* `opts`: Show both relative and absolute line number

## New Features

* `autocmds`: Added autocmd for loading last cursor position when a buffer is opened
* `auto-session`: Restore directory-based sessions
* `avante`: LLM chat
* `harpoon`: Quickly navigating pinned buffers
* `treesitter-context`: Show code context when scrolling
* `neo-tree`: Navigate project via tree structure
* `snacks`: Various QoL improvements and nice picker (especially for LSP symbols)
* `tiny-inline-diagnostic`: Inline diagnostics that properly wrap
* `treesitter-textobjects`: Quicky navigating through code
