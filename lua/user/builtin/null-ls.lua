-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  -- { name = "black" },
  -- { command = "stylua" },
  { name = "prettier", },
  { name = "fixjson",  filetypes = { "json" } },
}

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup {
  { command = "jsonlint",   filetypes = { "json" } },
  { command = "eslint",     filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } },
  { command = "shellcheck", args = { "--severity", "warning" }, },
  {
    command = "vint",
    args = { "--style-problem", "--json" },
    filetypes = { "vim" },
  },
}
