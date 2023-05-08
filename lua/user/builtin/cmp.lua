-- autocomplete cmp menu settings
lvim.builtin.cmp.completion.completeopt    = "menu,menuone"
lvim.builtin.cmp.completion.keyword_length = 1

-- init cmp-emmet
require('cmp').register_source('emmet', require('cmp-emmet').new())
vim.list_extend(lvim.builtin.cmp.sources, {
  { name = "emmet" },
})
