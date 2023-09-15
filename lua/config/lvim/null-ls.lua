lvim.lsp.null_ls.setup.ensure_installed = {
  "eslint_d",
  "goimports",
  "jsonlint",
  "prettierd",
  "shellcheck",
  "shfmt",
  "stylua",
}

-- Formatters
require("lvim.lsp.null-ls.formatters").setup {
  { name = "goimports" },
  { name = "prettierd" },
  {
    name = "shfmt",
    filetypes = { "sh", "bash", "zsh" },
  },
  { name = "stylua" },
}

-- Linters
require("lvim.lsp.null-ls.linters").setup {
  { name = "eslint_d" },
  { name = "jsonlint" },
  { name = "shellcheck", args = { "--severity", "warning" } },
}

-- Actions e.g. fix issues
require("lvim.lsp.null-ls.code_actions").setup {
  { name = "eslint_d" },
  { name = "shellcheck" },
}
