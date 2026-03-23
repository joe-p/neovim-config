-- llama-server --fim-qwen-7b-default
-- llama-server -hf sweepai/sweep-next-edit-1.5B --port 8012
-- llama-server --hf-file zeta-Q8_0.gguf -hf lmstudio-community/zeta-GGUF --port 8012
return {
  'ggml-org/llama.vim',
  enabled = true,
  init = function()
    vim.g.llama_config = {
      keymap_fim_accept_full = '<C-l>',
      keymap_fim_accept_line = '<C-k>',
      keymap_fim_trigger = '<C-j>',
      show_info = 0,
    }
  end,
}
