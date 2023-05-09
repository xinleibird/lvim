-- formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  -- { command = "stylua" },
  { name = "prettier", },
}

-- linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup {
  { command = "jsonlint",   filetypes = { "json" } },
  { command = "shellcheck", args = { "--severity", "warning" }, },
  {
    command = "eslint",
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
  },
}
