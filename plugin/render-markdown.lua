vim.pack.add {
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
}

require('render-markdown').setup {
  anti_conceal = { enabled = false },
  file_types = { 'pichat', 'markdown' },
  heading = {
    -- Useful context to have when evaluating values.
    -- | level    | the number of '#' in the heading marker         |
    -- | sections | for each level how deeply nested the heading is |

    -- Turn on / off heading icon & background rendering.
    enabled = true,
    -- Output is evaluated depending on the type.
    -- | function | `value(context)`              |
    -- | string[] | `cycle(value, context.level)` |
    icons = { '#₁ ', '##₂ ', '###₃ ', '####₄ ', '#####₅ ', '######₆ ' },
  },
}
