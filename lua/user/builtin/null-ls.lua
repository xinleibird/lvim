-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "shfmt",
    filetypes = { "sh", "bash", "zsh" },
  },
  { name = "stylua" },
  { name = "prettier" },
}

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "jsonlint", filetypes = { "json" } },
  { name = "shellcheck", args = { "--severity", "warning" } },
  { name = "eslint_d" },
}
