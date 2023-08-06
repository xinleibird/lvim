-- Autocomplete cmp menu settings
lvim.builtin.cmp.completion.completeopt = "menu,menuone"
lvim.builtin.cmp.completion.keyword_length = 1

lvim.builtin.cmp.window = {
  completion = {
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    col_offset = -3,
    side_padding = 0,
  },
}

lvim.builtin.cmp.formatting = {
  fields = { "kind", "abbr", "menu" },
  format = function(entry, vim_item)
    local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
    local strings = vim.split(kind.kind, "%s", { trimempty = true })
    kind.kind = " " .. (strings[1] or "") .. " "
    kind.menu = "   "

    return kind
  end,
}
