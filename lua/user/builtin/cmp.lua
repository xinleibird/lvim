-- Autocomplete cmp menu settings
lvim.builtin.cmp.completion.completeopt = "menu,menuone"
lvim.builtin.cmp.completion.keyword_length = 1

-- Init cmp-emmet
require("cmp").register_source("emmet", require("cmp-emmet").new())
vim.list_extend(lvim.builtin.cmp.sources, {
  { name = "emmet" },
})

lvim.builtin.cmp.formatting = {
  format = require("lspkind").cmp_format {
    mode = "symbol", -- show only symbol annotations
    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    ellipsis_char = "", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

    -- before = function(_, vim_item)
    --   return vim_item
    -- end
  },
}
