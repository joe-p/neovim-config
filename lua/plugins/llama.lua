return {
  'ggml-org/llama.vim',
  init = function()
    vim.g.llama_config = {
      keymap_accept_full = '<C-l>',
      keymap_accept_line = '<C-k>',
      show_info = 0,
    }
  end,
}
