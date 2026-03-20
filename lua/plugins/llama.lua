-- llama-server --fim-qwen-7b-default
-- llama-server -hf sweepai/sweep-next-edit-1.5B --port 8012
return {
  'ggml-org/llama.vim',
  enabled = true,
  init = function()
    vim.g.llama_config = {
      keymap_accept_full = '<C-l>',
      keymap_accept_line = '<C-k>',
      show_info = 0,
    }
  end,
}
