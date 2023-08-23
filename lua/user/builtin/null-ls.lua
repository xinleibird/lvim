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

-- Actions e.g. fix issues
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   { name = "shellcheck" },
--   { name = "eslint_d" },
-- }
