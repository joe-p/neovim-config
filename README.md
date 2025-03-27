# kickstart.vim

This is a fork of [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) which is a fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). 

I have made some changes to the original kickstart files but most of the changes I've made (i.e. plugins I've added) can be found in [lua/joe-p](./lua/joe-p). If you want to add your own plugins, it is recommended to make a directory with your GitHub username to prevent merge conflicts from my repo and upstream. 

To use this configuration, simply clone this repo as `~/.config/nvim` or use [$NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) to try this configuration without affecting your existing config.

This configuration targets the latest neovim release, 0.11. 

## Kickstart Changes

### Plugins
* `nvim-cmp`: Disabled in favor of blink
* `gitsigns`: Modified signs to be more like the default config, with the exception of using `+` for additions
* `gitsigns`: Use `]g` and `[g` to jump between git changes
* `gitsigns`: Use `<leader>H` instead of `<leader>h` for hunk actions since `h` is used for harpoon
* `gitsigns`: Use `<leader>Tg` and `<leader>TG` to toggle show deleted and current line blame
* `gitsigns`: Enable current line blame by default
* `telescope`: Removed in favor of `Snacks.picker`
* `lspconfig`: Removed telescope bindings in favor of `Snacks.picker`
* `lspconfig`: Rename is now `<leader>cr`
* `tokyonight`: Use `tokyonight-moon`

### Configuration

* `opts`: Show both relative and absolute line number
* `diagnostics`: Use `virtual_lines` 

## New Features

### Plugins

* `auto-dark-mode`: Toggle nvim colorscheme based on system theme
* `auto-session`: Restore directory-based sessions 
* `blink`: Use `blink` for auto-completion
* `bufferline`: See open buffers and quickly pin and switch between them
* `CopilotChat`: GitHub Copilot chat integration
* `diffview`: View Git diffs in side-by-side view (similar to VSCode)
* `flash`: Quickly jump to specific location in text
* `gitlinker`: Open links to code in remote repositories
* `grug-far`: Project-wide find and replace using
* `lazygit`: Lazygit integration
* `llama`: Local LLM FIM auto-completion (see the [README](https://github.com/ggml-org/llama.vim?tab=readme-ov-file#llamacpp-settings) for llama.cpp settings)
* `markview`: Markdown formatting
* `neotest`: Test runner/summary UI
* `snacks`: Various QoL improvements, explorer, and nice picker (especially for LSP symbols)
* `stickybuf`: Enables sticking a buf/file type to a window
* `treesitter-context`: Show code context when scrolling
* `treesitter-textobjects`: Quicky navigating through code
* `vimade`: Dim non-active windows

### Configuration

* `autocmds`: Added autocmd for loading last cursor position when a buffer is opened

## Hidden Keymaps

### Buffer Navigation

Most keymaps can be discovered via `which-key` by pressing `<leader>`, which is the space key by default. Keymaps for jumping around and moving buffers, however, are hidden since they would add a lot noise.

* `<leader>N` will jump to the Nth buffer
* `<leader>bN` will move the current buffer to the Nth position

These keys, in combination with pinning (`<leader>p`) will help you quickly switch between buffers
