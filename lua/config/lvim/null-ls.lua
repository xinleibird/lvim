local ok, null_ls = pcall(require, "null-ls")
if ok then
  local helpers = require "null-ls.helpers"
  local FORMATTING = require("null-ls.methods").internal.FORMATTING

  null_ls.register {
    --your custom sources go here
    helpers.make_builtin {
      name = "stopnoise",
      meta = {
        url = "https://github.com/jose-elias-alvarez/null-ls.nvim",
        description = "Stop [NO formatter] notify noise.",
      },
      method = FORMATTING,
      filetypes = { "vim" },
      generator_opts = {
        -- do nothing……
      },
      factory = helpers.formatter_factory,
    },
  }
end

lvim.lsp.null_ls.setup.ensure_installed = {
  "eslint_d",
  "goimports",
  "jsonlint",
  "prettierd",
  "shellcheck",
  "shfmt",
  "stylua",
  "vint",
}

-- Formatters
require("lvim.lsp.null-ls.formatters").setup {
  { name = "goimports" },
  { name = "prettierd", timeout_ms = 5000 },
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
  { name = "vint" },
}

-- Actions e.g. fix issues
require("lvim.lsp.null-ls.code_actions").setup {
  { name = "eslint_d" },
  { name = "shellcheck" },
}
