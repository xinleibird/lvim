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
      filetypes = { "vim", "NeogitCommitMessage" },
      generator_opts = {
        -- do nothing……
      },
      factory = helpers.formatter_factory,
    },
  }
end

lvim.lsp.null_ls.setup.ensure_installed = {
  "eslint",
  "goimports",
  "jsonlint",
  "prettier",
  "shellcheck",
  "shfmt",
  "stylua",
}

-- Formatters
require("lvim.lsp.null-ls.formatters").setup {
  { name = "goimports" },
  { name = "prettier" },
  {
    name = "shfmt",
    filetypes = { "sh", "bash", "zsh" },
  },
  { name = "stylua" },
}

-- Linters
require("lvim.lsp.null-ls.linters").setup {
  { name = "eslint" },
  { name = "jsonlint" },
  { name = "shellcheck", args = { "--severity", "warning" } },
}

-- Actions e.g. fix issues
require("lvim.lsp.null-ls.code_actions").setup {
  { name = "eslint" },
  { name = "shellcheck" },
}
