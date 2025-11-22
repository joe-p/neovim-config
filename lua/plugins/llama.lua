-- llama-server --fim-qwen-7b-default
return {
  'ggml-org/llama.vim',
  enabled = false,
  init = function()
    vim.g.llama_config = {
      keymap_accept_full = '<C-l>',
      keymap_accept_line = '<C-k>',
      show_info = 0,
    }
  end,
}
