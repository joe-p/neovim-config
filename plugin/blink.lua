vim.pack.add({ { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') } })

require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true },
    menu = {
      draw = {
        components = {
          label = {
            width = { fill = true, max = 60 },
            text = function(ctx)
              local full_label = ctx.label .. ctx.label_detail
              local has_text_edits = ctx.item.additionalTextEdits ~= nil and #ctx.item.additionalTextEdits > 0
              local has_imports = ctx.item.data ~= nil and ctx.item.data.imports ~= nil and #ctx.item.data.imports > 0

              if has_text_edits or has_imports then
                full_label = '~' .. full_label
              end

              return full_label
            end,
          },
        },
      },
    },
  },
  sources = {
    default = { 'lsp', 'path' },
  },
  cmdline = {
    keymap = {
      ['<Tab>'] = { 'show', 'accept' },
    },
    completion = { menu = { auto_show = true } },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
