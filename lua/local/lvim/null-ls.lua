-- Formatters
require("lvim.lsp.null-ls.formatters").setup {
  {
    name = "shfmt",
    filetypes = { "sh", "bash", "zsh" },
  },
  { name = "stylua" },
  { name = "prettierd", timeout_ms = 5000 },
  { name = "phpcs-cs-fixer" },
  { name = "goimports" },
}

-- Linters
require("lvim.lsp.null-ls.linters").setup {
  { name = "jsonlint" },
  { name = "shellcheck", args = { "--severity", "warning" } },
  { name = "eslint_d" },
  { name = "phpcs" },
}

-- Actions e.g. fix issues
require("lvim.lsp.null-ls.code_actions").setup {
  { name = "shellcheck" },
  { name = "eslint_d" },
}
