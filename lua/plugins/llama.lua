return {
  'ggml-org/llama.vim',
  init = function()
    vim.g.llama_config = {
      keymap_accept_full = '<C-j>',
      keymap_accept_line = '<C-l>',
      show_info = 0,
    }
  end,
}
